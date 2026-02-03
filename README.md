# 📅 BookerPro - Système de Calcul de Créneaux Horaires

Système de calcul automatique de créneaux horaires disponibles pour la réservation de services.

## 🎯 Fonctionnalités

- ✅ Calcul automatique des créneaux disponibles selon :
  - La durée du service
  - Les horaires d'ouverture du business
  - La disponibilité des employés
  - Les absences et congés
  - Les rendez-vous existants
  - La granularité paramétrable (par défaut 15 minutes)

- ✅ Interface web moderne avec modal dynamique
- ✅ API REST FastAPI
- ✅ Aucun rechargement de page requis
- ✅ Gestion des conflits et chevauchements

## 📋 Prérequis

- Python 3.11+ 
- MySQL 8.0+ (via MAMP ou autre)
- pip (gestionnaire de paquets Python)

## 🚀 Installation

### 1. Configurer MySQL (MAMP)

Si vous utilisez MAMP :

1. Démarrez MAMP
2. Ouvrez phpMyAdmin (généralement http://localhost:8888/phpMyAdmin/)
3. Créez une nouvelle base de données nommée `bookerpro_dev`
4. Importez le fichier SQL fourni :
   - Cliquez sur la base `bookerpro_dev`
   - Allez dans l'onglet "Importer"
   - Sélectionnez le fichier `bookerpro_dev.sql`
   - Cliquez sur "Exécuter"

### 2. Configurer le projet Python

```bash
# Cloner ou extraire le projet
cd /chemin/vers/le/projet

# Créer un environnement virtuel
python3 -m venv venv

# Activer l'environnement virtuel
# Sur Mac/Linux :
source venv/bin/activate
# Sur Windows :
venv\Scripts\activate

# Installer les dépendances
pip install -r requirements.txt
```

### 3. Configurer les variables d'environnement

Créez un fichier `.env` à la racine du projet :

```bash
cp .env.example .env
```

Modifiez le fichier `.env` avec vos paramètres MySQL :

```env
DB_HOST=localhost
DB_PORT=3306          # ou 8889 si vous utilisez MAMP
DB_USER=root
DB_PASSWORD=root      # ou votre mot de passe MAMP
DB_NAME=bookerpro_dev
SLOT_GRANULARITY_MINUTES=15
```

> **Note pour MAMP** : Le port MySQL par défaut de MAMP est souvent **8889** et non 3306.

### 4. Tester la connexion à la base de données

```bash
python -c "from database import engine; print('Connexion réussie!' if engine.connect() else 'Échec')"
```

## 🎮 Utilisation

### Démarrer le serveur

```bash
# Assurez-vous que l'environnement virtuel est activé
python main.py
```

Le serveur démarrera sur `http://localhost:8000`

### Accéder à l'interface web

Ouvrez votre navigateur et allez sur :
```
http://localhost:8000
```

### Utiliser l'API directement

#### Endpoint principal : Obtenir les créneaux disponibles

```bash
POST http://localhost:8000/api/slots/available
Content-Type: application/json

{
  "business_id": 1,
  "service_id": 1,
  "date": "2026-02-04",
  "granularity_minutes": 15
}
```

Réponse :
```json
{
  "date": "2026-02-04",
  "service_id": 1,
  "service_name": "Massage",
  "duration_minutes": 45,
  "available_slots": [
    {
      "start_time": "2026-02-04T09:00:00",
      "end_time": "2026-02-04T09:45:00",
      "staff_id": 1,
      "staff_name": "Jean Dupont"
    },
    {
      "start_time": "2026-02-04T09:15:00",
      "end_time": "2026-02-04T10:00:00",
      "staff_id": 2,
      "staff_name": "Marie Martin"
    }
  ],
  "total_slots": 2
}
```

#### Endpoint secondaire : Liste des services

```bash
GET http://localhost:8000/api/services/1
```

### Documentation API interactive

FastAPI génère automatiquement une documentation interactive :

- **Swagger UI** : http://localhost:8000/docs
- **ReDoc** : http://localhost:8000/redoc

## 🧪 Tests

### Tester avec des données d'exemple

La base de données fournie contient déjà des données de test :
- Business ID 1 : Un business avec des horaires 9h-12h / 13h-18h
- Plusieurs services actifs
- Des employés avec des autorisations de service
- Des rendez-vous existants pour tester les conflits

### Exemples de tests

1. **Test basique** : Service de 45 minutes, demain
   ```
   Business: 1
   Service: 1
   Date: Demain
   Granularité: 15 min
   ```

2. **Test avec conflit** : Vérifier qu'un créneau déjà réservé n'apparaît pas

3. **Test avec absence** : Ajouter une absence pour un employé et vérifier que ses créneaux disparaissent

## 📁 Structure du projet

```
bookerpro/
│
├── main.py                 # API FastAPI principale
├── database.py             # Configuration SQLAlchemy
├── models.py               # Modèles de base de données
├── schemas.py              # Schémas Pydantic
├── slot_service.py         # Logique métier de calcul des créneaux
├── requirements.txt        # Dépendances Python
├── .env.example            # Exemple de configuration
├── .env                    # Configuration (à créer)
│
├── static/                 # Frontend
│   ├── index.html          # Page HTML principale
│   ├── styles.css          # Styles CSS
│   └── app.js              # Logique JavaScript
│
└── bookerpro_dev.sql      # Dump de la base de données
```

## 🔧 Configuration avancée

### Modifier la granularité par défaut

Dans le fichier `.env` :
```env
SLOT_GRANULARITY_MINUTES=30  # Au lieu de 15
```

### Ajouter des services

Via MySQL/phpMyAdmin ou en utilisant l'API :
```sql
INSERT INTO services (business_id, name, description, duration_minutes, price_cents, is_active)
VALUES (1, 'Nouveau Service', 'Description', 60, 5000, 1);
```

### Configurer les horaires d'ouverture

Modifier la table `business_schedules` :
```sql
UPDATE business_schedules 
SET morning_starts_at = '08:00:00', 
    morning_ends_at = '13:00:00'
WHERE business_id = 1 AND day_of_week = 1;
```

## ⚙️ Logique de calcul des créneaux

### Algorithme

1. **Récupération du service** et de sa durée
2. **Horaires d'ouverture** : Récupération selon le jour de la semaine
3. **Employés autorisés** : Filtrage des employés habilités pour le service
4. **Génération des créneaux possibles** :
   - Créneaux du matin (si actif)
   - Créneaux de l'après-midi (si actif)
   - Respect de la granularité (ex: 09:00, 09:15, 09:30...)
5. **Filtrage par employé** :
   - Vérification des absences
   - Vérification des rendez-vous existants
   - Détection des chevauchements
6. **Déduplication** : Un créneau n'est proposé qu'une fois même si plusieurs employés sont disponibles
7. **Tri chronologique** des résultats

### Règles de validation

Un créneau est valide si et seulement si :

- ✅ La durée complète du service peut être couverte
- ✅ Le créneau est entièrement dans les horaires d'ouverture
- ✅ Au moins un employé est disponible et autorisé
- ✅ Aucun chevauchement avec une absence approuvée
- ✅ Aucun chevauchement avec un rendez-vous existant (pending ou confirmed)
- ✅ Le point de départ respecte la granularité

### Exemple de chevauchement

```
Service demandé : 45 minutes
Rendez-vous existant : 10:15 → 10:45

Créneau 10:00 → 10:45 : ❌ INVALIDE (chevauche 10:15-10:45)
Créneau 10:45 → 11:30 : ✅ VALIDE (commence à la fin du RDV)
```

## 🐛 Dépannage

### Erreur de connexion à MySQL

```
sqlalchemy.exc.OperationalError: (2003, "Can't connect to MySQL server...")
```

**Solutions** :
1. Vérifiez que MySQL/MAMP est démarré
2. Vérifiez le port dans `.env` (3306 ou 8889 pour MAMP)
3. Vérifiez les identifiants (user/password)

### Le frontend ne charge pas

```
ModuleNotFoundError: No module named 'fastapi'
```

**Solution** : Installez les dépendances
```bash
pip install -r requirements.txt
```

### Aucun service n'apparaît

**Solutions** :
1. Vérifiez que des services existent dans la table `services`
2. Vérifiez que `is_active = 1`
3. Vérifiez le `business_id` utilisé

### Les créneaux ne s'affichent pas

**Vérifications** :
1. Y a-t-il des employés dans `business_staff` ?
2. Les employés sont-ils liés au service dans `business_staff_service` ?
3. Y a-t-il des horaires configurés dans `business_schedules` ?
4. La date sélectionnée est-elle un jour ouvré ?

## 📝 Critères d'acceptation

- [x] Les créneaux apparaissent dans la modal sans rechargement de page
- [x] Un tableau de créneaux est retourné avec les employés associés
- [x] Prise en compte de la durée du service
- [x] Prise en compte des horaires d'ouverture
- [x] Prise en compte des disponibilités des employés
- [x] Prise en compte des absences
- [x] Détection des conflits avec rendez-vous existants
- [x] Pas de chevauchement multi-staff
- [x] Granularité paramétrable (15 min par défaut)
- [x] Créneaux partiels exclus

## 🚀 Améliorations futures

- [ ] Authentification des utilisateurs
- [ ] Réservation effective de créneaux
- [ ] Notifications par email
- [ ] Gestion des annulations
- [ ] Interface d'administration
- [ ] Support multi-langues
- [ ] Export des créneaux (PDF, iCal)
- [ ] Statistiques et rapports

## 📄 Licence

Ce projet est développé dans un cadre éducatif.

## 🤝 Support

Pour toute question ou problème, consultez :
- La documentation API : http://localhost:8000/docs
- Les logs du serveur dans la console
