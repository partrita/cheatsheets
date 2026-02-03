import os
import shutil
from pathlib import Path

# Paths
ROOT_DIR = Path(__file__).parent.parent
SRC_DIR = ROOT_DIR / "src"
DIST_DIR = ROOT_DIR / "dist"
WEBSITE_DIR = ROOT_DIR / "website"
PDFS_DIR = WEBSITE_DIR / "pdfs"
DOCS_DIR = WEBSITE_DIR / "docs"

def setup_directories():
    if PDFS_DIR.exists():
        shutil.rmtree(PDFS_DIR)
    PDFS_DIR.mkdir(parents=True, exist_ok=True)
    
    if DOCS_DIR.exists():
        shutil.rmtree(DOCS_DIR)
    DOCS_DIR.mkdir(parents=True, exist_ok=True)

def copy_pdfs():
    if not DIST_DIR.exists():
        print(f"Error: {DIST_DIR} does not exist. Run 'pixi run build' first.")
        return False
    
    for pdf_file in DIST_DIR.glob("*.pdf"):
        shutil.copy(pdf_file, PDFS_DIR / pdf_file.name)
        print(f"Copied {pdf_file.name} to website/pdfs/")
    return True

def generate_qmd_files():
    # Get list of pdfs
    pdfs = list(PDFS_DIR.glob("*.pdf"))
    
    index_content = """---
title: "Cheatsheets Collection"
format:
  html:
    toc: true
    theme: cosmo
---

Welcome to the collection of cheatsheets. Below you can find various cheatsheets available for download.

## Available Cheatsheets

| Name | Description | Download |
|------|-------------|----------|
"""
    
    for pdf in sorted(pdfs):
        filename = pdf.stem
        # Extract readable name: cheatsheet_go -> Go
        # cheatsheet_R_tidyverse -> R Tidyverse
        readable_name = filename.replace("cheatsheet_", "").replace("_", " ").title()
        
        # Create individual page
        page_filename = f"{filename}.qmd"
        page_path = DOCS_DIR / page_filename
        
        page_content = f"""---
title: "{readable_name} Cheatsheet"
format:
  html:
    toc: false
---

# {readable_name} Cheatsheet

preview of the {readable_name} cheatsheet.

<embed src="../pdfs/{pdf.name}" type="application/pdf" width="100%" height="800px" />

[Download PDF](../pdfs/{pdf.name}){{.btn .btn-primary role="button"}}

[Back to Index](../index.qmd)
"""
        
        with open(page_path, "w") as f:
            f.write(page_content)
        
        # Add to index
        index_content += f"| [{readable_name}](docs/{page_filename}) | {readable_name} Cheatsheet | [Download PDF](pdfs/{pdf.name}) |\n"

    # Write index.qmd
    with open(WEBSITE_DIR / "index.qmd", "w") as f:
        f.write(index_content)
        
    print("Generated website content.")

if __name__ == "__main__":
    setup_directories()
    if copy_pdfs():
        generate_qmd_files()
