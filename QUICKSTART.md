# Quick Start Guide

## 3 Simple Steps

### 1. Place Your Images
Put all your PNG files in the `protein_images` folder:
```
protein_images/
  ├── GDF15_Seq.12.34.png
  ├── IL6_Seq.23.45.png
  └── ... (all 10,776 files)
```

### 2. Generate List File
Run one of these commands:

**Node.js:**
```bash
node generate-list.js
```

**Python:**
```bash
python3 generate-list.py
```

This creates `protein_images/list.json` with all protein names.

### 3. Deploy to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

Then enable GitHub Pages in repository Settings → Pages.

## That's It! 🎉

Your webpage will be live at:
`https://YOUR_USERNAME.github.io/YOUR_REPO/`

The page will automatically:
- Show `GDF15_Seq.12.34` by default
- Allow searching through all 10,776 proteins
- Display images with optimized loading

## Need Help?

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

