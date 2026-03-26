package main

import (
    "encoding/json"
    "fmt"
    "io/fs"
    "os"
    "path/filepath"
    "strings"
)

type FileTypes map[string]interface{}

func main() {
    fmt.Println("🔍 Vérification des extensions du projet...")

    // Charger file_type.json
    data, err := os.ReadFile("file_type.json")
    if err != nil {
        panic(err)
    }

    var types FileTypes
    json.Unmarshal(data, &types)

    allowed := map[string]bool{}
    flatten(types, allowed)

    // Scanner le projet
    unknown := map[string]bool{}
    filepath.Walk(".", func(path string, info fs.FileInfo, err error) error {
        if err != nil || info.IsDir() {
            return nil
        }

        ext := strings.TrimPrefix(filepath.Ext(path), ".")
        if ext != "" && !allowed[ext] {
            unknown[ext] = true
        }
        return nil
    })

    // Résultats
    if len(unknown) == 0 {
        fmt.Println("✔ Aucune extension inconnue trouvée")
    } else {
        fmt.Println("⚠ Extensions inconnues détectées :")
        for ext := range unknown {
            fmt.Println(" -", ext)
        }
    }
}

func flatten(data FileTypes, out map[string]bool) {
    for _, v := range data {
        switch val := v.(type) {
        case []interface{}:
            for _, e := range val {
                out[e.(string)] = true
            }
        case map[string]interface{}:
            flatten(val, out)
        }
    }
}
