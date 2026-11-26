# Site handoff

## Purpose and structure

This repository is a lightweight static personal website for Fletcher Henneman. It has no build system or JavaScript framework.

- `index.html` is the resume-style home page.
- `projects.html` lists featured projects.
- `css/main.css` contains shared responsive styling, including light and dark palettes.
- `js/script.js` controls the mobile navigation and remembers the theme choice in `localStorage`.
- `Resume.pdf` is a separate resume document; its content can drift from the HTML pages.

## Design direction

The design uses a quiet resume-sheet layout with a light page background, white content surface, navy text, and blue accents based on the supplied `si.mil` palette. Dark mode uses the near-black palette and is available from the theme switch. Roboto is hosted locally; Font Awesome is currently loaded from its CDN in the HTML pages.

## Navigation behavior

The desktop navigation shows the site name, Home, Projects, Contact, and the theme switch in one row. At widths up to 600px it collapses to the site name and hamburger. Opening the hamburger reveals Home, Projects, Contact, and the theme switch with its moon icon. The current page is marked with a thin blue underline. Keep the expanded-menu `display: block` rule in sync with the collapsed rule that hides links after the brand.

The nav toggle is `responsiveNav()` in `js/script.js`; its `responsive` class controls the expanded mobile layout. Theme preference is stored under the `theme` localStorage key and applied to the root element's `data-theme` attribute.

## Content maintenance

Resume and project content is currently maintained directly in HTML and is duplicated in places. Before changing resume facts, compare `index.html` with `Resume.pdf` and confirm which version is authoritative. The project entries are also repeated between the home and projects pages, so keep those copies aligned when editing them.
