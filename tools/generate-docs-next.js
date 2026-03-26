import fs from "fs";
import path from "path";

const docsDir = "docs";
const outDir = "docs_mdx";

if (!fs.existsSync(outDir)) fs.mkdirSync(outDir);

function convert(md) {
  return (
`---
title: Auto Generated Page
---

` + md
  );
}

function walk(dir) {
  fs.readdirSync(dir).forEach(file => {
    const full = path.join(dir, file);

    if (fs.statSync(full).isDirectory()) {
      walk(full);
    } else if (file.endsWith(".md")) {
      const content = fs.readFileSync(full, "utf8");
      const mdx = convert(content);

      const outFile = path.join(outDir, file.replace(".md", ".mdx"));
      fs.writeFileSync(outFile, mdx);

      console.log("✔ Généré :", outFile);
    }
  });
}

walk(docsDir);
console.log("🎉 Documentation MDX générée dans /docs_mdx/");
