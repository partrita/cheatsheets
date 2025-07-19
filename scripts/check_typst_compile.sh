#!/bin/sh

echo "--- Running Typst compilation check for all .typ files in src/ ---"

# Define the output directory for temporary PDFs
TEMP_PDF_DIR=".typ_build_temp"
mkdir -p "$TEMP_PDF_DIR"

# Find all .typ files in src/ and attempt to compile each one
# Note: This approach compiles each .typ file individually into a temporary location.
# If your Typst project has a main entry point that includes others,
# you might only need to compile that main file.
# However, for catching syntax errors in all files, this is more thorough.
find src/ -name "*.typ" | while read -r typ_file; do
    # Construct an output PDF path in the temporary directory
    # This creates a dummy PDF for each .typ file, named after the original file.
    pdf_output="${TEMP_PDF_DIR}/$(basename "${typ_file%.typ}.pdf")"

    echo "Attempting to compile: ${typ_file}"

    # Execute the Typst compilation command
    # Adjust --font-path if your fonts are not in src/fonts relative to the repo root
    pixi run typst compile --font-path src/fonts "${typ_file}" "${pdf_output}"

    # Check the exit status of the command
    if [ $? -ne 0 ]; then
        echo "--- Typst compilation FAILED for ${typ_file}! Aborting commit. ---"
        echo "Please fix the 'unclosed delimiter' or other errors."
        # Clean up temporary directory on failure (optional)
        rm -rf "$TEMP_PDF_DIR"
        exit 1 # Abort the commit
    fi
done

# If all files compiled successfully
echo "--- All .typ files in src/ compiled successfully! ---"

# Clean up the temporary directory after successful compilation
rm -rf "$TEMP_PDF_DIR"

exit 0 # Allow the commit