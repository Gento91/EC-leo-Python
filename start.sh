#!/bin/bash

# Script de démarrage rapide pour BookerPro

echo "🚀 BookerPro - Démarrage du serveur..."
echo ""

# Vérifier si l'environnement virtuel existe
if [ ! -d "venv" ]; then
    echo "❌ Environnement virtuel non trouvé."
    echo "Veuillez d'abord exécuter : python3 -m venv venv"
    exit 1
fi

# Activer l'environnement virtuel
echo "🔧 Activation de l'environnement virtuel..."
source venv/bin/activate

# Vérifier si le fichier .env existe
if [ ! -f ".env" ]; then
    echo "⚠️  Fichier .env non trouvé."
    echo "Copie du fichier .env.example vers .env..."
    cp .env.example .env
    echo "✅ Fichier .env créé. Veuillez le configurer avec vos paramètres MySQL."
    echo ""
fi

# Installer/Mettre à jour les dépendances
echo "📦 Installation des dépendances..."
pip install -q -r requirements.txt

echo ""
echo "✅ Configuration terminée!"
echo ""
echo "🌐 Démarrage du serveur sur http://localhost:8000"
echo "📚 Documentation API : http://localhost:8000/docs"
echo ""
echo "Appuyez sur Ctrl+C pour arrêter le serveur"
echo ""

# Démarrer le serveur
python main.py
