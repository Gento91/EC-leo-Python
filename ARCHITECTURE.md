# 📐 Architecture technique - BookerPro

## Vue d'ensemble

BookerPro est une application web qui calcule automatiquement les créneaux horaires disponibles pour la réservation de services.

```
┌─────────────┐
│  Frontend   │  HTML/CSS/JS Vanilla
│   (Modal)   │  
└──────┬──────┘
       │ HTTP/JSON
       │
┌──────▼──────┐
│  FastAPI    │  API REST Python
│   Backend   │  
└──────┬──────┘
       │ SQLAlchemy ORM
       │
┌──────▼──────┐
│   MySQL     │  Base de données
│  (via MAMP) │  
└─────────────┘
```

## Stack technique

### Backend
- **Python 3.11+** : Langage de programmation
- **FastAPI 0.115.0** : Framework web moderne et rapide
- **SQLAlchemy 2.0.36** : ORM pour l'interaction avec la base de données
- **Pydantic 2.10.3** : Validation des données et schémas
- **Uvicorn 0.32.0** : Serveur ASGI

### Frontend
- **HTML5** : Structure de la page
- **CSS3** : Styles avec animations et responsive design
- **JavaScript Vanilla** : Pas de framework, juste du JS pur
- **Fetch API** : Requêtes AJAX vers le backend

### Base de données
- **MySQL 8.0+** : Système de gestion de base de données relationnelle
- **MAMP** : Environnement de développement (ou MySQL direct)

## Architecture de la base de données

### Tables principales

#### `businesses`
Représente les entreprises/commerces
- `id`, `name`, `address`, `city`, etc.

#### `business_schedules`
Horaires d'ouverture par jour de la semaine
- `business_id` (FK)
- `day_of_week` (0=Lundi, 6=Dimanche)
- `morning_active`, `morning_starts_at`, `morning_ends_at`
- `afternoon_active`, `afternoon_starts_at`, `afternoon_ends_at`

#### `services`
Services proposés par le business
- `business_id` (FK)
- `name`, `description`
- `duration_minutes` ⭐ (crucial pour le calcul)
- `price_cents`
- `is_active`

#### `users`
Utilisateurs (clients et employés)
- `id`, `first_name`, `last_name`, `email`, etc.

#### `business_staff`
Employés d'un business
- `business_id` (FK)
- `user_id` (FK)
- `role`

#### `business_staff_service`
Table de liaison : employés autorisés pour chaque service
- `business_staff_id` (FK)
- `service_id` (FK)

#### `appointments`
Rendez-vous réservés
- `business_id` (FK)
- `staff_user_id` (FK)
- `service_id` (FK)
- `starts_at`, `ends_at` ⭐
- `status` (pending, confirmed, cancelled, etc.)

#### `absences`
Absences/congés des employés
- `business_id` (FK)
- `user_id` (FK)
- `start_at`, `end_at` ⭐
- `absence_type`, `status`

### Relations

```
businesses 1──→ N business_schedules
businesses 1──→ N services
businesses 1──→ N business_staff

business_staff N ←──→ N services (via business_staff_service)

users 1──→ N business_staff
users 1──→ N appointments
users 1──→ N absences

services 1──→ N appointments
```

## Architecture du code

### Backend

```
main.py                    # Point d'entrée de l'API
├── Routes FastAPI
│   ├── POST /api/slots/available
│   ├── GET /api/services/{business_id}
│   └── GET /health
│
database.py                # Configuration SQLAlchemy
├── Connexion MySQL
├── Engine
└── SessionLocal
│
models.py                  # Modèles ORM
├── Business
├── BusinessSchedule
├── Service
├── User
├── BusinessStaff
├── BusinessStaffService
├── Appointment
└── Absence
│
schemas.py                 # Schémas Pydantic
├── SlotRequest
├── AvailableSlot
├── SlotsResponse
└── ErrorResponse
│
slot_service.py            # Logique métier ⭐
└── SlotCalculator
    ├── get_available_slots()
    ├── _get_authorized_staff()
    ├── _generate_possible_slots()
    ├── _filter_slots_for_staff()
    └── _overlaps_*()
```

### Frontend

```
static/
├── index.html             # Structure HTML
│   ├── Formulaire de recherche
│   └── Modal de résultats
│
├── styles.css             # Styles CSS
│   ├── Variables CSS
│   ├── Layout responsive
│   ├── Animations
│   └── Composants (card, modal, slots)
│
└── app.js                 # Logique JavaScript
    ├── loadServices()
    ├── handleFormSubmit()
    ├── fetchAvailableSlots()
    ├── displaySlots()
    └── Gestion de la modal
```

## Algorithme de calcul des créneaux

### Étape 1 : Récupération des données
```python
service = get_service(service_id)
duration = service.duration_minutes
schedule = get_business_schedule(business_id, day_of_week)
authorized_staff = get_authorized_staff(business_id, service_id)
```

### Étape 2 : Génération des créneaux théoriques
```python
for period in [morning, afternoon]:
    if period.active:
        current_time = period.starts_at
        while current_time + duration <= period.ends_at:
            possible_slots.append(current_time)
            current_time += granularity
```

### Étape 3 : Filtrage par employé
```python
for staff in authorized_staff:
    staff_absences = get_absences(staff, date)
    staff_appointments = get_appointments(staff, date)
    
    for slot in possible_slots:
        if not overlaps_absence(slot, staff_absences):
            if not overlaps_appointment(slot, staff_appointments):
                available_slots.append({
                    "slot": slot,
                    "staff": staff
                })
```

### Étape 4 : Déduplication
```python
unique_slots = {}
for slot in available_slots:
    if slot.start_time not in unique_slots:
        unique_slots[slot.start_time] = slot

return sorted(unique_slots.values())
```

## Détection de chevauchement

Deux créneaux se chevauchent si :
```
slot_start < existing_end AND slot_end > existing_start
```

Exemple :
```
Créneau A: 10:00 - 10:45
Créneau B: 10:30 - 11:15

10:00 < 11:15 AND 10:45 > 10:30 = TRUE → Chevauchement !
```

## Flow de l'application

### Scénario nominal

```
1. Utilisateur ouvre http://localhost:8000
   ↓
2. JavaScript charge les services via GET /api/services/1
   ↓
3. Utilisateur sélectionne service, date, granularité
   ↓
4. Utilisateur soumet le formulaire
   ↓
5. JavaScript fait POST /api/slots/available
   ↓
6. Backend calcule les créneaux disponibles
   ↓
7. Réponse JSON retournée au frontend
   ↓
8. Modal s'ouvre avec les créneaux (sans rechargement !)
   ↓
9. Utilisateur peut cliquer sur un créneau
```

## Gestion des erreurs

### Frontend
- Validation des formulaires
- Affichage d'alertes en cas d'erreur
- Spinner pendant le chargement

### Backend
- HTTPException pour erreurs HTTP
- Messages d'erreur détaillés
- Logs des exceptions

### Codes HTTP
- `200` : Succès
- `404` : Service non trouvé
- `400` : Données invalides
- `500` : Erreur serveur

## Performance

### Optimisations appliquées
- Requêtes SQL optimisées avec filtres
- Déduplication des créneaux
- Pas de N+1 queries (jointures)
- Index sur les clés étrangères

### Améliorations possibles
- Cache Redis pour services et horaires
- Pagination des créneaux si > 100
- Compression des réponses JSON
- Pool de connexions MySQL ajusté

## Sécurité

### Actuel (développement)
- CORS ouvert (`allow_origins=["*"]`)
- Pas d'authentification
- Connexion MySQL en clair

### Production (recommandations)
- CORS restreint aux domaines autorisés
- Authentification JWT ou OAuth2
- HTTPS obligatoire
- Variables d'environnement sécurisées
- Rate limiting sur l'API
- Validation stricte des inputs
- Connexion SSL à MySQL

## Déploiement

### Développement local
```bash
python main.py  # Port 8000
```

### Production (exemple)
```bash
# Avec gunicorn
gunicorn -w 4 -k uvicorn.workers.UvicornWorker main:app

# Avec Docker
docker build -t bookerpro .
docker run -p 8000:8000 bookerpro

# Avec nginx en reverse proxy
nginx → http://localhost:8000
```

## Tests

### Tests unitaires (à implémenter)
- Tests des fonctions de `SlotCalculator`
- Tests des modèles SQLAlchemy
- Tests des schémas Pydantic

### Tests d'intégration
- `test_api.py` : Tests des endpoints
- Tests de bout en bout du flow complet

### Tests de performance
- Benchmarking avec 1000+ créneaux
- Tests de charge avec locust/k6

## Extensibilité

### Ajout d'une fonctionnalité
1. Créer le modèle dans `models.py`
2. Créer le schéma dans `schemas.py`
3. Ajouter la logique dans un service dédié
4. Créer le endpoint dans `main.py`
5. Mettre à jour le frontend si nécessaire

### Ajout d'un critère de filtrage
1. Modifier `_filter_slots_for_staff()` dans `slot_service.py`
2. Ajouter les requêtes SQL nécessaires
3. Documenter le critère

## Monitoring (production)

### Logs
- Utiliser `logging` Python
- Centralisation avec ELK/Grafana Loki

### Métriques
- Temps de réponse des endpoints
- Nombre de créneaux calculés
- Erreurs 4xx/5xx
- Utilisation CPU/RAM

### Alertes
- API down
- Temps de réponse > 2s
- Taux d'erreur > 5%
- Connexion MySQL perdue

## Maintenance

### Base de données
- Backups quotidiens
- Nettoyage des anciens rendez-vous
- Optimisation des index

### Code
- Mise à jour des dépendances
- Refactoring régulier
- Documentation à jour

## Conclusion

Cette architecture privilégie :
- ✅ Simplicité et clarté du code
- ✅ Séparation des responsabilités
- ✅ Extensibilité future
- ✅ Performance acceptable
- ✅ Facilité de débogage

C'est une base solide pour un MVP qui peut évoluer vers un produit plus robuste.
