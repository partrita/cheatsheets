#!/bin/bash
set -e
set -o pipefail

# Output directory
OUTPUT_DIR="dist"
mkdir -p "$OUTPUT_DIR"

echo "--- Building all .typ files from src/ to $OUTPUT_DIR/ ---"

find src/ -name "*.typ" -not -path "src/templates/*" -print0 | while IFS= read -r -d '' typ_file; do
    # Get the relative path from src/
    rel_path=${typ_file#src/}
    # Replace .typ with .pdf
    output_rel_path="${rel_path%.typ}.pdf"
    output_path="$OUTPUT_DIR/$output_rel_path"
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$output_path")"
    
    echo "Compiling: $typ_file -> $output_path"
    pixi run typst compile --root . --font-path src/fonts "$typ_file" "$output_path"
done

echo "--- Build complete! ---"
