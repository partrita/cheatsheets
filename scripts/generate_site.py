import os
import shutil
from pathlib import Path
from collections import defaultdict

# Paths
ROOT_DIR = Path(__file__).parent.parent
SRC_DIR = ROOT_DIR / "src"
DIST_DIR = ROOT_DIR / "dist"
WEBSITE_DIR = ROOT_DIR / "website"
PDFS_DIR = WEBSITE_DIR / "pdfs"
DOCS_DIR = WEBSITE_DIR / "docs"

def setup_directories():
    """Create and clean the target directories for the website."""
    if PDFS_DIR.exists():
        shutil.rmtree(PDFS_DIR)
    PDFS_DIR.mkdir(parents=True, exist_ok=True)
    
    if DOCS_DIR.exists():
        shutil.rmtree(DOCS_DIR)
    DOCS_DIR.mkdir(parents=True, exist_ok=True)

def copy_pdfs():
    """Copy PDFs from the dist folder to the website folder, preserving language subdirectories."""
    if not DIST_DIR.exists():
        print(f"Error: {DIST_DIR} does not exist. Run 'pixi run build' first.")
        return False
    
    copied_count = 0
    # Search for PDFs in language subdirectories (en, ko)
    for pdf_file in DIST_DIR.rglob("*.pdf"):
        rel_path = pdf_file.relative_to(DIST_DIR)
        
        # We only care about PDFs in en/ or ko/ folders
        if not (rel_path.parts[0] in ['en', 'ko']):
            continue
            
        dest_path = PDFS_DIR / rel_path
        dest_path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy(pdf_file, dest_path)
        print(f"Copied {rel_path} to website/pdfs/")
        copied_count += 1
    
    if copied_count == 0:
        print("Warning: No PDFs found in dist/en or dist/ko.")
        return False
    return True

def generate_qmd_files():
    """Generate Quarto (.qmd) files for the website index and individual cheatsheet pages."""
    # Group PDFs by base filename to handle multi-language versions
    # cheatsheets[base_name][lang] = relative_path_to_pdf
    cheatsheets = defaultdict(dict)
    
    # We iterate over the copied PDFs in the website/pdfs directory
    for pdf in PDFS_DIR.rglob("*.pdf"):
        lang = pdf.parent.name # 'en' or 'ko'
        base_name = pdf.stem
        # Store path relative to website root
        cheatsheets[base_name][lang] = pdf.relative_to(WEBSITE_DIR)

    index_content = """---
title: "Cheatsheets Collection"
format:
  html:
    toc: true
    theme: cosmo
---

Welcome to the collection of cheatsheets. You can view and download them in both English and Korean.

## Available Cheatsheets

| Name | English | Korean |
|------|:-------:|:------:|
"""
    
    for base_name in sorted(cheatsheets.keys()):
        # Skip internal files
        if base_name in ["conf", "icons"]:
            continue
            
        # Format a readable name: cheatsheet_python_pandas -> Python Pandas
        display_name = base_name.replace("cheatsheet_", "").replace("_", " ").title()
        
        langs = cheatsheets[base_name]
        
        # Create individual cheatsheet page
        page_filename = f"{base_name}.qmd"
        page_path = DOCS_DIR / page_filename
        
        # Decide which version to preview (prefer English if available)
        preview_lang = 'en' if 'en' in langs else 'ko'
        preview_path = langs[preview_lang]
        
        page_content = f"""---
title: "{display_name} Cheatsheet"
format:
  html:
    toc: false
---

### Available Downloads

| Language | PDF Document |
|----------|:------------:|
"""
        if 'en' in langs:
            page_content += f"| English | [Download PDF](../{langs['en']}) |\n"
        if 'ko' in langs:
            page_content += f"| Korean | [Download PDF](../{langs['ko']}) |\n"

        page_content += f"""
---

### Preview ({'English' if preview_lang == 'en' else 'Korean'})

<embed src="../{preview_path}" type="application/pdf" width="100%" height="1000px" />

[Back to Index](../index.qmd)
"""
        
        with open(page_path, "w") as f:
            f.write(page_content)
        
        # Add entry to main index
        # We point to the individual page first, then provide direct download links
        en_download = f"[English]({langs['en']})" if 'en' in langs else "-"
        ko_download = f"[Korean]({langs['ko']})" if 'ko' in langs else "-"
        
        index_content += f"| [{display_name}](docs/{page_filename}) | {en_download} | {ko_download} |\n"

    # Write the main index.qmd
    with open(WEBSITE_DIR / "index.qmd", "w") as f:
        f.write(index_content)
        
    print(f"Generated {len(cheatsheets)} cheatsheet pages and updated index.")

if __name__ == "__main__":
    setup_directories()
    if copy_pdfs():
        generate_qmd_files()
    else:
        print("Failed to generate site content.")
