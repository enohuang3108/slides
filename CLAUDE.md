# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Architecture

This is a **Slidev monorepo** for managing multiple slide presentations with automated GitHub Pages deployment. Key structural elements:

- **Monorepo structure**: Uses pnpm workspaces to manage multiple Slidev projects
- **Year-based organization**: Presentations are organized in folders like `2025/`, `demo/`
- **Individual presentation structure**: Each presentation has its own `package.json`, `slides.md`, components, and assets
- **Shared resources**: Common styles in `shared/` and custom fonts in `fonts/`
- **Automated deployment**: GitHub Actions builds all presentations and creates an index page

## Common Development Commands

### Development
```bash
# Start interactive picker to select and run a specific presentation
pnpm dev

# Navigate to specific presentation and run dev server
cd 2025/mcp-intro
pnpm dev

# Build all presentations
pnpm build

# Run linting across all projects
pnpm lint

# Preview built presentations
pnpm preview
```

### Creating New Presentations
```bash
cd 2025
npx slidev init new-presentation-name
```

## Key Files and Scripts

- **`scripts/picker.ts`**: Interactive CLI tool to select presentations for development
- **`scripts/create-index.sh`**: Generates the main index.html page with all presentation links and search functionality
- **`pnpm-workspace.yaml`**: Defines workspace packages (`demo/*`, `202*/*`, `203*/*`)
- **`.github/workflows/deploy.yml`**: Automated deployment to GitHub Pages

## Slidev-specific Conventions

- Each presentation uses `slides.md` as the main content file
- Frontmatter in `slides.md` contains `title:` and `info:` for metadata
- Custom components are stored in `components/` folder within each presentation
- Public assets (images, etc.) go in `public/` folder
- Build output targets `../../dist/[year]/[presentation-name]` for GitHub Pages structure
- Custom fonts are loaded from shared `fonts/` directory

## Build Process

1. Each presentation builds to `dist/[path]/` maintaining directory structure
2. The index generation script scans all `slides.md` files to extract titles and metadata
3. GitHub Actions orchestrates building all presentations and creating the index page
4. Final deployment includes `.nojekyll` file for proper GitHub Pages serving

## Development Tips

- The picker script (`pnpm dev`) automatically detects all year-based and demo folders
- Presentations use hash-based routing for better GitHub Pages compatibility
- Custom themes and components can be shared across presentations
- Image assets should be placed in each presentation's `public/` folder

## Slidev Advanced Techniques

### Frontmatter Configuration
```yaml
---
title: Presentation Title
theme: apple-basic
info: |
  ## Description
  Multi-line presentation description
lineNumbers: true
transition: slide-left
colorSchema: light
routerMode: hash
layout: section
fonts:
  sans: 'LINESeedTW, Noto Sans TC, Roboto'
  mono: 'Fira Code'
  local: ['LINESeedTW']
---
```

### Layout Techniques
- **Two-column layout**: Use `layout: two-cols` with `::right::` separator
- **Center layout**: Use `layout: center` for centered content
- **Section layout**: Use `layout: section` for title slides

### Content Techniques
- **Code highlighting**: Use `{all|1-2|4-5|7-9}` for progressive code highlighting
- **Image sizing**: Use Tailwind classes like `class="h-80 mx-auto"`, `class="h-100"`
- **Grid layouts**: Use `<div class="grid grid-cols-2 gap-4">` for multi-column content
- **Text styling**: Use `<div class="text-xl leading-relaxed">` for better typography

### Custom Components
- **Footnote system**: Use `<Footnotes>` and `<Footnote>` components for references
  ```vue
  <Footnotes x='l'>
    <Footnote :number=1><a href="...">Link</a></Footnote>
  </Footnotes>
  ```
- **MaxHeightContainer**: For content overflow management
- **FontTest**: For demonstrating font features

### Speaker Notes
- Use HTML comments `<!-- notes -->` for presenter notes
- Notes are visible in presenter mode but hidden in slides

### Image Best Practices
- Use WebP format for better compression (`image.webp`)
- Reference images from `public/` folder with absolute paths (`/image.webp`)
- Apply responsive sizing with Tailwind classes

### Progressive Code Revealing
```markdown
```python {all|1-2|4-5|7-9}
code here
```
```

### CSS Integration
- Custom styles in `style.css` for presentation-specific styling
- Use Tailwind utility classes extensively for layouts
- Support for custom font loading and Variable Fonts