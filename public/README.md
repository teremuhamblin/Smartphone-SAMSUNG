🌐 public — Fichiers Publics & Contenu Statique du Projet Smartphone Samsung

Le dossier public contient tous les fichiers statiques destinés à être servis tels quels lors de la génération du site, de la documentation ou des prévisualisations du projet Samsung Next-Gen Smartphone.

Il représente la vitrine publique du projet : images optimisées, pages statiques, manifestes, ressources front-end et tout contenu accessible directement par l’utilisateur final.

---

📌 Objectifs du dossier

- Centraliser les fichiers statiques accessibles publiquement  
- Servir de base à un site de documentation ou une prévisualisation produit  
- Héberger les assets optimisés destinés au web  
- Fournir une structure propre et compatible avec les générateurs (Next.js, Vite, Astro, etc.)  
- Séparer clairement les ressources publiques des ressources internes (assets/, data/, docs/)  

---

🗂️ Structure recommandée

public/images/
Images optimisées pour le web :
- Rendus du smartphone  
- Illustrations marketing  
- Miniatures pour la documentation  
- Logos et icônes web  

Formats recommandés :  
- .webp  
- .png optimisé  
- .svg  

public/docs/
Documentation statique générée :
- Pages HTML  
- PDF exportés  
- Guides publics  
- Fiches techniques compilées  

> Ces fichiers sont généralement générés automatiquement depuis docs/.

public/assets/
Ressources front-end :
- CSS statiques  
- JavaScript non compilé  
- Fonts web  
- Fichiers manifest  

public/meta/
Métadonnées publiques :
- manifest.json  
- robots.txt  
- sitemap.xml  
- Données OpenGraph  

public/downloads/
Fichiers téléchargeables :
- Fiches techniques PDF  
- Présentations internes  
- Rapports de benchmarks  

---

🧩 Bonnes pratiques

- Ne placer ici que des fichiers destinés à être publics  
- Optimiser systématiquement les images avant publication  
- Ne jamais stocker de données sensibles ou internes  
- Garder une structure simple et stable  
- Versionner les fichiers lourds avec soin  
- Utiliser des noms explicites et cohérents  

---

🛠️ Intégration avec les pipelines

Les workflows CI/CD peuvent automatiser :

- L’optimisation des images avant publication  
- La génération des pages statiques depuis docs/  
- La création automatique du sitemap.xml  
- La validation des fichiers publics (taille, format, accessibilité)  
- La publication du dossier public dans les releases ou sur un site statique  

---

🎯 Vision

Le dossier public est la vitrine externe du projet.  
Il reflète la qualité, la cohérence et le professionnalisme de ton écosystème Samsung.  
C’est ici que les utilisateurs, testeurs ou partenaires accèdent au contenu final, propre et optimisé.

---
