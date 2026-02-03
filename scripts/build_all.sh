#!/bin/bash
set -e
set -o pipefail

# Output directory
OUTPUT_DIR="dist"
mkdir -p "$OUTPUT_DIR"

echo "--- Building all .typ files from src/ to $OUTPUT_DIR/ ---"

find src/ -name "*.typ" -print0 | while IFS= read -r -d '' typ_file; do
    filename=$(basename "$typ_file" .typ)
    output_path="$OUTPUT_DIR/${filename}.pdf"
    
    echo "Compiling: $typ_file -> $output_path"
    pixi run typst compile --font-path src/fonts "$typ_file" "$output_path"
done

echo "--- Build complete! ---"
