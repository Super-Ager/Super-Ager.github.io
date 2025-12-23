# Protein Visualization Webpage

A beautiful, interactive webpage for exploring 10,776 circulating protein visualization images.

## Features

- 🔍 **Fuzzy Search**: Search proteins by gene name or sequence
- ⌨️ **Keyboard Navigation**: Use arrow keys to navigate search results
- 🖼️ **Optimized Image Loading**: Lazy loading and efficient image display
- 📱 **Responsive Design**: Works on desktop and mobile devices
- 🎨 **Modern UI**: Beautiful gradient design with smooth animations

## Setup Instructions

### 1. Prepare Your Images

Place all your PNG files in a `protein_images` folder:
```
protein_images/
  ├── GDF15_Seq.12.34.png
  ├── IL6_Seq.23.45.png
  └── ... (10,776 files)
```

### 2. Generate Protein List (Optional but Recommended)

For better performance with 10,000+ files, create a `list.json` file in the `protein_images` folder containing all protein names:

```json
[
  "GDF15_Seq.12.34",
  "IL6_Seq.23.45",
  "TNF_Seq.34.56",
  ...
]
```

You can generate this file using a script:

```bash
# Using Python
python3 -c "import os, json; files = [f.replace('.png', '') for f in os.listdir('protein_images') if f.endswith('.png')]; json.dump(sorted(files), open('protein_images/list.json', 'w'))"

# Or using Node.js
node -e "const fs = require('fs'); const files = fs.readdirSync('protein_images').filter(f => f.endsWith('.png')).map(f => f.replace('.png', '')).sort(); fs.writeFileSync('protein_images/list.json', JSON.stringify(files));"
```

### 3. Deploy to GitHub Pages

1. Create a new GitHub repository
2. Push all files to the repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```

3. Enable GitHub Pages:
   - Go to repository Settings
   - Navigate to Pages section
   - Select source branch (usually `main`)
   - Select folder (usually `/root`)
   - Click Save

4. Your site will be available at:
   `https://YOUR_USERNAME.github.io/YOUR_REPO/`

## File Structure

```
.
├── index.html          # Main HTML file
├── styles.css          # Styling
├── script.js           # JavaScript functionality
├── README.md           # This file
└── protein_images/     # Your PNG files
    ├── list.json       # (Optional) List of all proteins
    ├── GDF15_Seq.12.34.png
    └── ...
```

## Performance Optimization

- **Lazy Loading**: Images load only when needed
- **Debounced Search**: Reduces search operations
- **Limited Results**: Shows max 50 results at a time
- **Efficient Rendering**: Uses virtual scrolling concepts

## Browser Support

Works on all modern browsers:
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers

## Customization

You can customize colors, fonts, and layout by editing `styles.css`. The main color scheme uses a purple gradient (`#667eea` to `#764ba2`).

