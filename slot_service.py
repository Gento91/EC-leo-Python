"""
Service de calcul des créneaux horaires disponibles
"""
from datetime import datetime, timedelta, time, date
from typing import List, Tuple, Set
from sqlalchemy.orm import Session
from sqlalchemy import and_, or_

from models import (
    Business, Service, BusinessSchedule, BusinessStaff, 
    BusinessStaffService, Appointment, Absence, User,
    AppointmentStatus, AbsenceStatus
)
from schemas import AvailableSlot


class SlotCalculator:
    """
    Calcule les créneaux horaires disponibles selon les contraintes métier
    """
    
    def __init__(self, db: Session):
        self.db = db
    
    def get_available_slots(
        self, 
        business_id: int, 
        service_id: int, 
        target_date: date,
        granularity_minutes: int = 15
    ) -> List[AvailableSlot]:
        """
        Calcule tous les créneaux disponibles pour un service à une date donnée
        
        Args:
            business_id: ID du business
            service_id: ID du service
            target_date: Date pour laquelle calculer les créneaux
            granularity_minutes: Granularité des créneaux (par défaut 15 min)
            
        Returns:
            Liste des créneaux disponibles avec l'employé assigné
        """
        # 1. Récupérer le service et sa durée
        service = self.db.query(Service).filter(
            Service.id == service_id,
            Service.business_id == business_id,
            Service.is_active == True
        ).first()
        
        if not service:
            return []
        
        duration_minutes = service.duration_minutes
        
        # 2. Récupérer les horaires d'ouverture du business pour ce jour
        day_of_week = target_date.weekday()  # 0=Lundi, 6=Dimanche
        business_schedule = self.db.query(BusinessSchedule).filter(
            BusinessSchedule.business_id == business_id,
            BusinessSchedule.day_of_week == day_of_week
        ).first()
        
        if not business_schedule:
            return []
        
        # 3. Récupérer les employés autorisés pour ce service
        authorized_staff = self._get_authorized_staff(business_id, service_id)
        
        if not authorized_staff:
            return []
        
        # 4. Générer tous les créneaux possibles selon les horaires d'ouverture
        possible_slots = self._generate_possible_slots(
            target_date, 
            business_schedule, 
            duration_minutes,
            granularity_minutes
        )
        
        # 5. Pour chaque employé, filtrer les créneaux disponibles
        available_slots = []
        used_slot_times: Set[datetime] = set()  # Pour éviter les doublons
        
        for staff in authorized_staff:
            staff_slots = self._filter_slots_for_staff(
                staff,
                possible_slots,
                duration_minutes,
                target_date
            )
            
            # Ajouter uniquement les créneaux qui ne sont pas déjà proposés
            for slot_start, slot_end in staff_slots:
                if slot_start not in used_slot_times:
                    available_slots.append(AvailableSlot(
                        start_time=slot_start,
                        end_time=slot_end,
                        staff_id=staff.user_id,
                        staff_name=f"{staff.user.first_name} {staff.user.last_name}"
                    ))
                    used_slot_times.add(slot_start)
        
        # Trier par heure de début
        available_slots.sort(key=lambda x: x.start_time)
        
        return available_slots
    
    def _get_authorized_staff(self, business_id: int, service_id: int) -> List[BusinessStaff]:
        """
        Récupère les employés autorisés à réaliser un service
        """
        return self.db.query(BusinessStaff).join(
            BusinessStaffService,
            BusinessStaff.id == BusinessStaffService.business_staff_id
        ).join(
            User,
            BusinessStaff.user_id == User.id
        ).filter(
            BusinessStaff.business_id == business_id,
            BusinessStaffService.service_id == service_id
        ).all()
    
    def _generate_possible_slots(
        self,
        target_date: date,
        schedule: BusinessSchedule,
        duration_minutes: int,
        granularity_minutes: int
    ) -> List[Tuple[datetime, datetime]]:
        """
        Génère tous les créneaux possibles selon les horaires d'ouverture
        """
        slots = []
        
        # Créneaux du matin
        if schedule.morning_active and schedule.morning_starts_at and schedule.morning_ends_at:
            slots.extend(self._generate_slots_for_period(
                target_date,
                schedule.morning_starts_at,
                schedule.morning_ends_at,
                duration_minutes,
                granularity_minutes
            ))
        
        # Créneaux de l'après-midi
        if schedule.afternoon_active and schedule.afternoon_starts_at and schedule.afternoon_ends_at:
            slots.extend(self._generate_slots_for_period(
                target_date,
                schedule.afternoon_starts_at,
                schedule.afternoon_ends_at,
                duration_minutes,
                granularity_minutes
            ))
        
        return slots
    
    def _generate_slots_for_period(
        self,
        target_date: date,
        start_time: time,
        end_time: time,
        duration_minutes: int,
        granularity_minutes: int
    ) -> List[Tuple[datetime, datetime]]:
        """
        Génère les créneaux pour une période (matin ou après-midi)
        """
        slots = []
        
        # Convertir en datetime
        current = datetime.combine(target_date, start_time)
        period_end = datetime.combine(target_date, end_time)
        
        # Arrondir le début au multiple de granularité le plus proche
        minutes_offset = current.minute % granularity_minutes
        if minutes_offset != 0:
            current += timedelta(minutes=granularity_minutes - minutes_offset)
        
        # Générer les créneaux
        while True:
            slot_end = current + timedelta(minutes=duration_minutes)
            
            # Le créneau doit se terminer avant ou à la fermeture
            if slot_end > period_end:
                break
            
            slots.append((current, slot_end))
            current += timedelta(minutes=granularity_minutes)
        
        return slots
    
    def _filter_slots_for_staff(
        self,
        staff: BusinessStaff,
        possible_slots: List[Tuple[datetime, datetime]],
        duration_minutes: int,
        target_date: date
    ) -> List[Tuple[datetime, datetime]]:
        """
        Filtre les créneaux disponibles pour un employé spécifique
        """
        # Récupérer les absences de l'employé pour ce jour
        absences = self._get_staff_absences(staff.user_id, target_date)
        
        # Récupérer les rendez-vous existants de l'employé pour ce jour
        appointments = self._get_staff_appointments(staff.user_id, target_date)
        
        available_slots = []
        
        for slot_start, slot_end in possible_slots:
            # Vérifier que le créneau ne chevauche pas une absence
            if self._overlaps_absence(slot_start, slot_end, absences):
                continue
            
            # Vérifier que le créneau ne chevauche pas un rendez-vous
            if self._overlaps_appointment(slot_start, slot_end, appointments):
                continue
            
            available_slots.append((slot_start, slot_end))
        
        return available_slots
    
    def _get_staff_absences(self, user_id: int, target_date: date) -> List[Absence]:
        """
        Récupère les absences approuvées d'un employé pour une date donnée
        """
        day_start = datetime.combine(target_date, time.min)
        day_end = datetime.combine(target_date, time.max)
        
        return self.db.query(Absence).filter(
            Absence.user_id == user_id,
            Absence.status == AbsenceStatus.APPROVED,
            # L'absence chevauche le jour ciblé
            Absence.start_at < day_end,
            Absence.end_at > day_start
        ).all()
    
    def _get_staff_appointments(self, user_id: int, target_date: date) -> List[Appointment]:
        """
        Récupère les rendez-vous confirmés d'un employé pour une date donnée
        """
        day_start = datetime.combine(target_date, time.min)
        day_end = datetime.combine(target_date, time.max)
        
        return self.db.query(Appointment).filter(
            Appointment.staff_user_id == user_id,
            Appointment.status.in_([
                AppointmentStatus.PENDING,
                AppointmentStatus.CONFIRMED
            ]),
            # Le rendez-vous est ce jour-là
            Appointment.starts_at >= day_start,
            Appointment.starts_at < day_end
        ).all()
    
    def _overlaps_absence(
        self,
        slot_start: datetime,
        slot_end: datetime,
        absences: List[Absence]
    ) -> bool:
        """
        Vérifie si un créneau chevauche une absence
        """
        for absence in absences:
            # Deux créneaux se chevauchent si :
            # - Le début de l'un est avant la fin de l'autre ET
            # - La fin de l'un est après le début de l'autre
            if slot_start < absence.end_at and slot_end > absence.start_at:
                return True
        return False
    
    def _overlaps_appointment(
        self,
        slot_start: datetime,
        slot_end: datetime,
        appointments: List[Appointment]
    ) -> bool:
        """
        Vérifie si un créneau chevauche un rendez-vous existant
        """
        for appointment in appointments:
            # Chevauchement : même logique que pour les absences
            if slot_start < appointment.ends_at and slot_end > appointment.starts_at:
                return True
        return False
