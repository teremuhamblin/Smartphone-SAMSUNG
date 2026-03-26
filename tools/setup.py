---

# 🛠️ **Script de setup : `tools/setup.py`**

Voici un script Python simple, propre et efficace pour initialiser ton projet :

```python
#!/usr/bin/env python3
import os
import json

PROJECT_DIRS = [
    "docs",
    "data",
    "data/raw",
    "data/specs",
    "src",
    "src/api",
    "src/cli",
    "src/parsers",
    "src/utils",
    "assets",
    "assets/images",
    "assets/diagrams",
    "assets/branding",
    "tests",
    "tools"
]

def create_directories():
    print("📁 Vérification des dossiers…")
    for d in PROJECT_DIRS:
        if not os.path.exists(d):
            os.makedirs(d)
            print(f"  ➕ Créé : {d}")
        else:
            print(f"  ✔ Existe déjà : {d}")

def create_placeholder_files():
    print("\n📄 Création de fichiers placeholder…")
    placeholders = {
        "data/devices.json": [],
        "data/os_versions.json": [],
        "data/raw/sources.md": "# Sources de données\n",
        "assets/branding/palette.md": "# Palette de couleurs Samsung\n",
    }

    for path, content in placeholders.items():
        if not os.path.exists(path):
            with open(path, "w", encoding="utf-8") as f:
                if isinstance(content, list):
                    json.dump(content, f, indent=4)
                else:
                    f.write(content)
            print(f"  ➕ Créé : {path}")
        else:
            print(f"  ✔ Existe déjà : {path}")

def main():
    print("🚀 Initialisation du projet Samsung Devices & OS Knowledge Suite\n")
    create_directories()
    create_placeholder_files()
    print("\n🎉 Setup terminé ! Votre projet est prêt.")

if __name__ == "__main__":
    main()
