"""
Schémas Pydantic pour la validation des données d'entrée/sortie
"""
from pydantic import BaseModel, Field
from datetime import datetime, date
from typing import List, Optional


class SlotRequest(BaseModel):
    """
    Requête pour obtenir les créneaux disponibles
    """
    business_id: int = Field(..., description="ID du business")
    service_id: int = Field(..., description="ID du service demandé")
    date: date = Field(..., description="Date pour laquelle chercher des créneaux (YYYY-MM-DD)")
    granularity_minutes: int = Field(default=15, description="Granularité des créneaux en minutes")
    
    class Config:
        json_schema_extra = {
            "example": {
                "business_id": 1,
                "service_id": 1,
                "date": "2026-02-04",
                "granularity_minutes": 15
            }
        }


class AvailableSlot(BaseModel):
    """
    Un créneau horaire disponible
    """
    start_time: datetime = Field(..., description="Heure de début du créneau")
    end_time: datetime = Field(..., description="Heure de fin du créneau")
    staff_id: int = Field(..., description="ID de l'employé disponible")
    staff_name: str = Field(..., description="Nom complet de l'employé")
    
    class Config:
        json_schema_extra = {
            "example": {
                "start_time": "2026-02-04T09:00:00",
                "end_time": "2026-02-04T09:45:00",
                "staff_id": 1,
                "staff_name": "Jean Dupont"
            }
        }


class SlotsResponse(BaseModel):
    """
    Réponse contenant tous les créneaux disponibles
    """
    date: date = Field(..., description="Date des créneaux")
    service_id: int = Field(..., description="ID du service")
    service_name: str = Field(..., description="Nom du service")
    duration_minutes: int = Field(..., description="Durée du service en minutes")
    available_slots: List[AvailableSlot] = Field(..., description="Liste des créneaux disponibles")
    total_slots: int = Field(..., description="Nombre total de créneaux disponibles")
    
    class Config:
        json_schema_extra = {
            "example": {
                "date": "2026-02-04",
                "service_id": 1,
                "service_name": "Massage",
                "duration_minutes": 45,
                "available_slots": [],
                "total_slots": 0
            }
        }


class ErrorResponse(BaseModel):
    """
    Réponse d'erreur standardisée
    """
    error: str = Field(..., description="Type d'erreur")
    message: str = Field(..., description="Message d'erreur détaillé")
    details: Optional[dict] = Field(None, description="Détails supplémentaires")
