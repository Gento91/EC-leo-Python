"""
Modèles SQLAlchemy correspondant à la structure de la base de données
"""
from sqlalchemy import Column, BigInteger, Integer, String, Text, DateTime, Time, Boolean, Enum, ForeignKey
from sqlalchemy.orm import relationship
from database import Base
import enum


class AbsenceType(str, enum.Enum):
    VACATION = "vacation"
    SICK = "sick"
    TRAINING = "training"
    CLOSED = "closed"
    OTHER = "other"


class AbsenceStatus(str, enum.Enum):
    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"


class AppointmentStatus(str, enum.Enum):
    PENDING = "pending"
    CONFIRMED = "confirmed"
    CANCELLED = "cancelled"
    COMPLETED = "completed"
    NO_SHOW = "no_show"


class Business(Base):
    __tablename__ = "businesses"
    
    id = Column(BigInteger, primary_key=True, index=True)
    name = Column(String(191), nullable=False)
    address = Column(String(191))
    zipcode = Column(String(191))
    city = Column(String(191))
    country = Column(String(191))
    industry = Column(String(191))
    timezone = Column(String(191))
    siret = Column(String(191))
    
    schedules = relationship("BusinessSchedule", back_populates="business")
    services = relationship("Service", back_populates="business")
    staff = relationship("BusinessStaff", back_populates="business")
    appointments = relationship("Appointment", back_populates="business")
    absences = relationship("Absence", back_populates="business")


class BusinessSchedule(Base):
    __tablename__ = "business_schedules"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_id = Column(BigInteger, ForeignKey("businesses.id"), nullable=False)
    day_of_week = Column(Integer, nullable=False)  # 0=Lundi, 6=Dimanche
    morning_active = Column(Boolean, default=True)
    morning_starts_at = Column(Time)
    morning_ends_at = Column(Time)
    afternoon_active = Column(Boolean, default=True)
    afternoon_starts_at = Column(Time)
    afternoon_ends_at = Column(Time)
    
    business = relationship("Business", back_populates="schedules")


class Service(Base):
    __tablename__ = "services"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_id = Column(BigInteger, ForeignKey("businesses.id"), nullable=False)
    name = Column(String(191), nullable=False)
    description = Column(Text)
    duration_minutes = Column(Integer, nullable=False)
    price_cents = Column(Integer)
    is_active = Column(Boolean, default=True)
    
    business = relationship("Business", back_populates="services")
    appointments = relationship("Appointment", back_populates="service")
    staff_services = relationship("BusinessStaffService", back_populates="service")


class User(Base):
    __tablename__ = "users"
    
    id = Column(BigInteger, primary_key=True, index=True)
    last_name = Column(String(191))
    first_name = Column(String(191))
    email = Column(String(191), unique=True)
    phone_e164 = Column(String(191))
    account_type = Column(String(191))
    
    staff_records = relationship("BusinessStaff", back_populates="user")


class BusinessStaff(Base):
    __tablename__ = "business_staff"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_id = Column(BigInteger, ForeignKey("businesses.id"), nullable=False)
    user_id = Column(BigInteger, ForeignKey("users.id"), nullable=False)
    role = Column(String(191))
    
    business = relationship("Business", back_populates="staff")
    user = relationship("User", back_populates="staff_records")
    services = relationship("BusinessStaffService", back_populates="staff")
    appointments = relationship("Appointment", foreign_keys="Appointment.staff_user_id")
    absences = relationship("Absence", foreign_keys="Absence.user_id")


class BusinessStaffService(Base):
    __tablename__ = "business_staff_service"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_staff_id = Column(BigInteger, ForeignKey("business_staff.id"), nullable=False)
    service_id = Column(BigInteger, ForeignKey("services.id"), nullable=False)
    
    staff = relationship("BusinessStaff", back_populates="services")
    service = relationship("Service", back_populates="staff_services")


class Appointment(Base):
    __tablename__ = "appointments"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_id = Column(BigInteger, ForeignKey("businesses.id"), nullable=False)
    client_user_id = Column(BigInteger, ForeignKey("users.id"))
    staff_user_id = Column(BigInteger, ForeignKey("users.id"))
    service_id = Column(BigInteger, ForeignKey("services.id"))
    starts_at = Column(DateTime, nullable=False)
    ends_at = Column(DateTime, nullable=False)
    status = Column(Enum(AppointmentStatus), nullable=False, default=AppointmentStatus.PENDING)
    notes = Column(Text)
    
    business = relationship("Business", back_populates="appointments")
    service = relationship("Service", back_populates="appointments")


class Absence(Base):
    __tablename__ = "absences"
    
    id = Column(BigInteger, primary_key=True, index=True)
    business_id = Column(BigInteger, ForeignKey("businesses.id"), nullable=False)
    user_id = Column(BigInteger, ForeignKey("users.id"))
    start_at = Column(DateTime, nullable=False)
    end_at = Column(DateTime, nullable=False)
    absence_type = Column(Enum(AbsenceType), nullable=False, default=AbsenceType.VACATION)
    status = Column(Enum(AbsenceStatus), nullable=False, default=AbsenceStatus.APPROVED)
    comment = Column(Text)
    
    business = relationship("Business", back_populates="absences")
