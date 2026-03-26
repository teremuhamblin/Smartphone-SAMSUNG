#!/bin/bash

echo "==============================================="
echo "  🚀 Pipeline de documentation Samsung"
echo "==============================================="
echo ""

# 1. Génération du site statique (Java)
echo "📘 Étape 1 : Génération du site statique..."
javac tools/StaticSiteGenerator.java
java -cp tools StaticSiteGenerator
echo "✔ Site statique généré dans /public/"
echo ""

# 2. Génération de l’index dynamique (Rust)
echo "📗 Étape 2 : Génération de l'index dynamique..."
rustc tools/generate_index.rs -o tools/generate_index
./tools/generate_index
echo "✔ Index HTML mis à jour"
echo ""

# 3. Génération du sitemap (Lisp)
echo "📙 Étape 3 : Génération du sitemap..."
sbcl --script tools/generate_sitemap.lisp
echo "✔ sitemap.xml généré"
echo ""

# 4. Génération des fichiers MDX (Next.js)
echo "📕 Étape 4 : Génération des fichiers MDX..."
node tools/generate-docs-next.js
echo "✔ Fichiers MDX générés dans /docs_mdx/"
echo ""

# 5. Copie du thème CSS
echo "📘 Étape 5 : Application du thème CSS..."
cp public/theme.css public/theme.css
echo "✔ Thème CSS appliqué"
echo ""

echo "🎉 Pipeline de documentation terminé avec succès !"
