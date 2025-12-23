#!/usr/bin/env node

/**
 * Generate list.json file from all PNG files in protein_images folder
 * Run this script after placing all your PNG files in the protein_images folder
 * 
 * Usage: node generate-list.js
 */

const fs = require('fs');
const path = require('path');

const IMAGE_FOLDER = path.join(__dirname, 'protein_images');
const OUTPUT_FILE = path.join(IMAGE_FOLDER, 'list.json');

try {
    // Check if protein_images folder exists
    if (!fs.existsSync(IMAGE_FOLDER)) {
        console.log('Creating protein_images folder...');
        fs.mkdirSync(IMAGE_FOLDER, { recursive: true });
        console.log('Please place your PNG files in the protein_images folder and run this script again.');
        process.exit(0);
    }

    // Read all files in the folder
    const files = fs.readdirSync(IMAGE_FOLDER);
    
    // Filter PNG files and remove extension
    const proteins = files
        .filter(file => file.toLowerCase().endsWith('.png'))
        .map(file => file.replace(/\.png$/i, ''))
        .sort();

    if (proteins.length === 0) {
        console.log('No PNG files found in protein_images folder.');
        console.log('Please place your PNG files in the protein_images folder and run this script again.');
        process.exit(1);
    }

    // Write to list.json
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(proteins, null, 2), 'utf8');

    console.log(`✅ Successfully generated list.json with ${proteins.length} proteins.`);
    console.log(`   Output file: ${OUTPUT_FILE}`);
    console.log(`   First protein: ${proteins[0]}`);
    console.log(`   Last protein: ${proteins[proteins.length - 1]}`);
    
} catch (error) {
    console.error('❌ Error generating list.json:', error.message);
    process.exit(1);
}

