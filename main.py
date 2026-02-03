"""
API FastAPI pour le calcul des créneaux horaires disponibles
"""
from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from sqlalchemy.orm import Session
from datetime import date

from database import get_db
from models import Service
from schemas import SlotRequest, SlotsResponse, ErrorResponse, AvailableSlot
from slot_service import SlotCalculator

app = FastAPI(
    title="BookerPro - API de gestion des créneaux",
    description="API pour calculer les créneaux horaires disponibles",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", include_in_schema=False)
async def root():
    """
    Sert la page d'accueil HTML
    """
    return FileResponse("static/index.html")


@app.get("/health")
async def health_check():
    """
    Endpoint de santé pour vérifier que l'API fonctionne
    """
    return {"status": "ok", "message": "API is running"}


@app.post(
    "/api/slots/available",
    response_model=SlotsResponse,
    responses={
        404: {"model": ErrorResponse},
        400: {"model": ErrorResponse},
        500: {"model": ErrorResponse}
    },
    summary="Obtenir les créneaux disponibles",
    description="""
    Calcule et retourne tous les créneaux horaires disponibles pour un service donné à une date précise.
    
    **Critères pris en compte :**
    - Durée du service
    - Horaires d'ouverture du business
    - Disponibilité des employés autorisés
    - Absences des employés
    - Rendez-vous existants
    - Granularité des créneaux (par défaut 15 minutes)
    """
)
async def get_available_slots(
    request: SlotRequest,
    db: Session = Depends(get_db)
):
    """
    Endpoint principal pour obtenir les créneaux disponibles
    """
    try:
        service = db.query(Service).filter(
            Service.id == request.service_id,
            Service.business_id == request.business_id,
            Service.is_active == True
        ).first()
        
        if not service:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "error": "ServiceNotFound",
                    "message": f"Le service avec l'ID {request.service_id} n'existe pas ou n'est pas actif"
                }
            )
        
        calculator = SlotCalculator(db)
        available_slots = calculator.get_available_slots(
            business_id=request.business_id,
            service_id=request.service_id,
            target_date=request.date,
            granularity_minutes=request.granularity_minutes
        )
        
        return SlotsResponse(
            date=request.date,
            service_id=service.id,
            service_name=service.name,
            duration_minutes=service.duration_minutes,
            available_slots=available_slots,
            total_slots=len(available_slots)
        )
    
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "InternalServerError",
                "message": f"Une erreur s'est produite lors du calcul des créneaux: {str(e)}"
            }
        )


@app.get("/api/services/{business_id}", summary="Obtenir les services d'un business")
async def get_services(business_id: int, db: Session = Depends(get_db)):
    """
    Récupère tous les services actifs d'un business
    """
    services = db.query(Service).filter(
        Service.business_id == business_id,
        Service.is_active == True
    ).all()
    
    return [
        {
            "id": service.id,
            "name": service.name,
            "description": service.description,
            "duration_minutes": service.duration_minutes,
            "price_cents": service.price_cents
        }
        for service in services
    ]


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
