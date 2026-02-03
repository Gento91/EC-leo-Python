# 🚀 Guide de démarrage rapide - BookerPro

## Installation en 5 minutes

### 1️⃣ Prérequis

- Python 3.11+ installé
- MAMP (ou MySQL) installé et démarré
- Le fichier `bookerpro_dev.sql` fourni

### 2️⃣ Importer la base de données

1. Ouvrez MAMP et démarrez les serveurs
2. Allez sur http://localhost:8888/phpMyAdmin/ (ou votre URL phpMyAdmin)
3. Créez une nouvelle base de données : `bookerpro_dev`
4. Cliquez sur la base, puis "Importer"
5. Sélectionnez le fichier `bookerpro_dev.sql`
6. Cliquez sur "Exécuter"

### 3️⃣ Installer le projet

```bash
# Aller dans le dossier du projet
cd /chemin/vers/bookerpro

# Créer l'environnement virtuel
python3 -m venv venv

# Activer l'environnement (Mac/Linux)
source venv/bin/activate

# Installer les dépendances
pip install -r requirements.txt

# Copier le fichier de configuration
cp .env.example .env
```

### 4️⃣ Configurer la connexion MySQL

Éditez le fichier `.env` :

```env
DB_HOST=localhost
DB_PORT=8889          # ⚠️ Port MAMP par défaut (ou 3306 pour MySQL standard)
DB_USER=root
DB_PASSWORD=root      # Votre mot de passe MAMP
DB_NAME=bookerpro_dev
```

### 5️⃣ Démarrer le serveur

```bash
python main.py
```

Vous devriez voir :
```
INFO:     Started server process
INFO:     Uvicorn running on http://0.0.0.0:8000
```

### 6️⃣ Tester l'application

Ouvrez votre navigateur : **http://localhost:8000**

Ou utilisez le script de test :
```bash
python test_api.py
```

## 🎮 Utilisation rapide

1. **Sélectionnez un service** (par défaut : service ID 1)
2. **Choisissez une date** (par défaut : demain)
3. **Cliquez sur "Rechercher les créneaux disponibles"**
4. **La modal s'ouvre** avec tous les créneaux disponibles !

## 🔧 Dépannage express

### ❌ Erreur de connexion MySQL

```
Can't connect to MySQL server on 'localhost'
```

**Solutions** :
- Vérifiez que MAMP est démarré
- Changez le port dans `.env` (essayez 8889 ou 3306)
- Vérifiez le mot de passe

### ❌ Aucun module nommé 'fastapi'

```
ModuleNotFoundError: No module named 'fastapi'
```

**Solution** :
```bash
source venv/bin/activate  # Activer l'environnement
pip install -r requirements.txt
```

### ❌ Aucun service disponible

**Solutions** :
- Vérifiez que la base de données est bien importée
- Vérifiez le `business_id` (par défaut : 1)
- Dans phpMyAdmin, vérifiez que la table `services` contient des données

## 📚 Ressources

- **Documentation API** : http://localhost:8000/docs
- **Interface web** : http://localhost:8000
- **README complet** : Voir `README.md`

## ✅ Tests rapides

```bash
# Test de santé de l'API
curl http://localhost:8000/health

# Récupérer les services
curl http://localhost:8000/api/services/1

# Tester les créneaux
curl -X POST http://localhost:8000/api/slots/available \
  -H "Content-Type: application/json" \
  -d '{
    "business_id": 1,
    "service_id": 1,
    "date": "2026-02-04",
    "granularity_minutes": 15
  }'
```

## 🎉 C'est tout !

Votre application BookerPro est maintenant opérationnelle !

Pour plus de détails, consultez le `README.md` complet.
