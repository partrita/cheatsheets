#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e
set -o pipefail

echo "--- Running Typst compilation check for all .typ files in src/ ---"

# Define directory for temporary PDF outputs
TEMP_PDF_DIR=".typ_build_temp"
rm -rf "$TEMP_PDF_DIR"
mkdir -p "$TEMP_PDF_DIR"

# Cleanup function to be called on failure
cleanup_on_error() {
    echo "--- Typst compilation FAILED! ---"
    rm -rf "$TEMP_PDF_DIR"
    exit 1
}

# Trap signals and errors
trap cleanup_on_error ERR

# Find all .typ files excluding templates
find src/ -name "*.typ" -not -path "src/templates/*" -print0 | while IFS= read -r -d '' typ_file; do
    echo "Checking: ${typ_file}"

    # Generate a unique temporary output path
    # We use the relative path from src/ to avoid collisions and check structure
    rel_path=${typ_file#src/}
    output_rel_path="${rel_path%.typ}.pdf"
    output_path="$TEMP_PDF_DIR/$output_rel_path"
    
    mkdir -p "$(dirname "$output_path")"

    # Compile with --root .
    pixi run typst compile --root . --font-path src/fonts "${typ_file}" "${output_path}"
done

echo "--- All .typ files in src/ compiled successfully! ---"

# Cleanup on success
rm -rf "$TEMP_PDF_DIR"

exit 0