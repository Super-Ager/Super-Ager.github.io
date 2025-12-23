# Deployment Guide

## Quick Start

1. **Place your images**: Put all PNG files in the `protein_images` folder
2. **Generate list**: Run `node generate-list.js` or `python3 generate-list.py`
3. **Deploy**: Push to GitHub and enable Pages

## Detailed Steps

### Step 1: Organize Your Files

Create the folder structure:
```
agingwebpage/
├── index.html
├── styles.css
├── script.js
├── protein_images/
│   ├── GDF15_Seq.12.34.png
│   ├── IL6_Seq.23.45.png
│   └── ... (all your PNG files)
```

### Step 2: Generate Protein List

For better performance with 10,000+ files, generate a `list.json` file:

**Option A: Using Node.js**
```bash
node generate-list.js
```

**Option B: Using Python**
```bash
python3 generate-list.py
```

This will create `protein_images/list.json` containing all protein names.

### Step 3: Test Locally (Optional)

You can test the webpage locally using a simple HTTP server:

**Using Python:**
```bash
python3 -m http.server 8000
```

**Using Node.js:**
```bash
npx http-server -p 8000
```

Then open `http://localhost:8000` in your browser.

### Step 4: Deploy to GitHub Pages

1. **Create a GitHub repository:**
   - Go to GitHub and create a new repository
   - Name it (e.g., `protein-visualization`)

2. **Initialize and push your code:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Protein visualization webpage"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```

3. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click on **Settings**
   - Scroll down to **Pages** section
   - Under **Source**, select:
     - Branch: `main`
     - Folder: `/ (root)`
   - Click **Save**

4. **Wait for deployment:**
   - GitHub will build and deploy your site
   - Usually takes 1-2 minutes
   - Your site will be available at:
     `https://YOUR_USERNAME.github.io/YOUR_REPO/`

### Step 5: Upload Images

**Important:** GitHub has file size limits:
- Individual files: 100MB max
- Repository: 1GB recommended, 100GB hard limit

For 10,000+ images at ~100KB each (~1GB total), you have options:

**Option A: Use Git LFS (Large File Storage)**
```bash
git lfs install
git lfs track "*.png"
git add .gitattributes
git add protein_images/*.png
git commit -m "Add protein images with LFS"
git push
```

**Option B: Host images separately**
- Upload images to a CDN or cloud storage
- Update `IMAGE_FOLDER` in `script.js` to point to the CDN URL

**Option C: Use GitHub Releases**
- Create a release with images as assets
- Or use a separate repository for images

## Troubleshooting

### Images not loading?
- Check that file paths match exactly (case-sensitive)
- Verify `list.json` contains correct filenames (without .png extension)
- Check browser console for 404 errors

### Search not working?
- Ensure `list.json` exists and is valid JSON
- Check browser console for JavaScript errors
- Verify all files are properly committed

### Page looks broken?
- Clear browser cache
- Check that all CSS/JS files are loaded (Network tab)
- Verify file paths are correct

## Performance Tips

1. **Use list.json**: Essential for 10,000+ files
2. **Enable compression**: GitHub Pages automatically compresses files
3. **Consider CDN**: For faster image loading globally
4. **Optimize images**: Compress PNGs if possible (they're already small at 100KB)

## Custom Domain (Optional)

If you have a custom domain:
1. Add a `CNAME` file with your domain name
2. Configure DNS records as GitHub instructs
3. Update GitHub Pages settings with your domain

