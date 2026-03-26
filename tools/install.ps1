Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "  🚀 Installation du projet Samsung" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# Vérification Python
Write-Host "🔍 Vérification de Python..."
$python = Get-Command python -ErrorAction SilentlyContinue

if (-not $python) {
    Write-Host "❌ Python n'est pas installé. Installe Python 3.10+ puis relance ce script." -ForegroundColor Red
    exit
}
Write-Host "✔ Python détecté : $($python.Source)" -ForegroundColor Green
Write-Host ""

# Création de l'environnement virtuel
Write-Host "🧪 Création de l'environnement virtuel..."
python -m venv venv

if (-not (Test-Path "venv")) {
    Write-Host "❌ Impossible de créer l'environnement virtuel." -ForegroundColor Red
    exit
}

Write-Host "✔ Environnement créé." -ForegroundColor Green
Write-Host ""

# Activation de l'environnement
Write-Host "⚙ Activation de l'environnement..."
& "venv/Scripts/Activate.ps1"
Write-Host "✔ Environnement activé." -ForegroundColor Green
Write-Host ""

# Installation des dépendances
if (Test-Path "requirements.txt") {
    Write-Host "📦 Installation des dépendances..."
    pip install -r requirements.txt
    Write-Host "✔ Dépendances installées." -ForegroundColor Green
} else {
    Write-Host "⚠ Aucun fichier requirements.txt trouvé." -ForegroundColor Yellow
}
Write-Host ""

# Exécution du script de setup
if (Test-Path "tools/setup.py") {
    Write-Host "🛠 Exécution du script de setup..."
    python tools/setup.py
} else {
    Write-Host "⚠ Le script tools/setup.py est introuvable." -ForegroundColor Yellow
}
Write-Host ""

Write-
