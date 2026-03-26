#!/bin/bash

echo "==============================================="
echo "  🚀 Installation du projet Samsung"
echo "==============================================="
echo ""

# Vérification Python
echo "🔍 Vérification de Python..."
if ! command -v python3 &> /dev/null
then
    echo "❌ Python 3 n'est pas installé. Installe Python 3.10+ puis relance ce script."
    exit
fi
echo "✔ Python détecté."
echo ""

# Création de l'environnement virtuel
echo "🧪 Création de l'environnement virtuel..."
python3 -m venv venv
source venv/bin/activate
echo "✔ Environnement activé."
echo ""

# Installation des dépendances
if [ -f "requirements.txt" ]; then
    echo "📦 Installation des dépendances..."
    pip install -r requirements.txt
    echo "✔ Dépendances installées."
else
    echo "⚠ Aucun fichier requirements.txt trouvé."
fi
echo ""

# Exécution du script de setup
if [ -f "tools/setup.py" ]; then
    echo "🛠 Exécution du script de setup..."
    python tools/setup.py
else
    echo "⚠ Le script tools/setup.py est introuvable."
fi
echo ""

echo "🎉 Installation terminée !"
