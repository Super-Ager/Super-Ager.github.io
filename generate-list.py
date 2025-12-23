#!/usr/bin/env python3
"""
Generate list.json file from all PNG files in protein_images folder
Run this script after placing all your PNG files in the protein_images folder

Usage: python3 generate-list.py
"""

import os
import json
from pathlib import Path

IMAGE_FOLDER = Path('/home/ww/Project/protein_images/')
OUTPUT_FILE = 'list.json'

try:
    # Check if protein_images folder exists
    if not IMAGE_FOLDER.exists():
        print('Creating protein_images folder...')
        IMAGE_FOLDER.mkdir(parents=True, exist_ok=True)
        print('Please place your PNG files in the protein_images folder and run this script again.')
        exit(0)

    # Read all files in the folder
    files = list(IMAGE_FOLDER.iterdir())
    
    # Filter PNG files and remove extension
    proteins = sorted([
        f.stem for f in files 
        if f.is_file() and f.suffix.lower() == '.png'
    ])

    if not proteins:
        print('No PNG files found in protein_images folder.')
        print('Please place your PNG files in the protein_images folder and run this script again.')
        exit(1)

    # Write to list.json
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        json.dump(proteins, f, indent=2, ensure_ascii=False)

    print(f'✅ Successfully generated list.json with {len(proteins)} proteins.')
    print(f'   Output file: {OUTPUT_FILE}')
    print(f'   First protein: {proteins[0]}')
    print(f'   Last protein: {proteins[-1]}')
    
except Exception as error:
    print(f'❌ Error generating list.json: {error}')
    exit(1)

