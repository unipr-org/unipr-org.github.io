#!/bin/bash

# Configura le directory
SITE_DIR="repository"
REPOS_FILE="scripts/repos.txt"
TMP_REPO="tmp_repo"
USERNAME="unipr-org"

# Pulizia e preparazione directory
rm -rf $SITE_DIR
mkdir -p $SITE_DIR

# Verifica che il file esista
if [[ ! -f "$REPOS_FILE" ]]; then
    echo "Error: File not found at '$REPOS_FILE'"
    exit 1
fi

# Leggi il file riga per riga e stampa il contenuto
while IFS= read -r repo; do
    echo "Processing $repo..."

    if [[ -z "$repo" ]]; then continue; fi # Salta righe vuote

    rm -rf $TMP_REPO
    mkdir $TMP_REPO
    git clone --depth=1 https://github.com/$USERNAME/$repo.git $TMP_REPO > /dev/null

    repo_dir="$SITE_DIR/$repo"
    mkdir -p $repo_dir

    tmp_artifacts_html="$TMP_REPO/artifacts/html"

    if [[ -d "$tmp_artifacts_html" ]]; then
        cp -r $tmp_artifacts_html/* $repo_dir/
    else
        echo "Warning: No artifacts/html directory in $repo"
    fi
    rm -rf $TMP_REPO

done < "$REPOS_FILE"

INDEX=$SITE_DIR/index.md

# Genera l'homepage
echo "<html> <head> 
    <title>Unipr Repositories</title>
    </head> <body>
    <h1>Repositories</h1> <ul>" > $INDEX

for repo_dir in $SITE_DIR/*; do
    repo_name=$(basename $repo_dir)
    if [[ "$repo_name" == "index.md" ]]; then continue; fi

    echo "<li><a href=\"$repo_name\">$repo_name</a></li>" >> $INDEX

    # Genera la pagina per ogni repository
    echo "<html> <head> <title>$repo_name</title> </head> <body>
        <h1>Files in $repo_name</h1> <ul>" > "$repo_dir/index.md"

    for file in "$repo_dir"/*; do
        file_name=$(basename "$file")
        if [[ "$file_name" == "index.md" ]]; then continue; fi
        if [[ "$file_name" == "images" ]]; then continue; fi

        # Rimuove i tag <style>...</style> dal file
        if [[ "$file" == *.html ]]; then
            echo "Processing file: $file (removing <style> tags)"
            sed '/<style/,/<\/style>/d' "$file" > "$file.tmp" && mv "$file.tmp" "$file" # Rimuove lo stile css
            
            # Rimuove la prima riga del file (quella che contiene <!DOCTYPE html>)
            tail -n +2 "$file" > "$file.tmp" && mv "$file.tmp" "$file"
            
            # Cambia l'estensione da .html a .md
            mv "$file" "${file%.html}.md"
        fi
        
        echo "<li><a href=\"$file_name\">$file_name</a></li>" >> "$repo_dir/index.md"
        
    done

    echo "</ul> </body> </html>" >> "$repo_dir/index.md"
done

echo "</ul> </body> </html>" >> $INDEX