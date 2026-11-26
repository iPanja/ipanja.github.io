# Site handoff

## Purpose and structure

This repository is a lightweight static personal website for Fletcher Henneman. It has no build system or JavaScript framework.

- `index.html` is the resume-style home page.
- `projects.html` lists featured projects.
- `css/main.css` contains shared responsive styling, including light and dark palettes.
- `js/script.js` controls the mobile navigation and remembers the theme choice in `localStorage`.
- `Resume.pdf` is a separate resume document; its content can drift from the HTML pages.

## Design direction

The design uses a quiet resume-sheet layout with a light page background, white content surface, navy text, and blue accents based on the supplied `si.mil` palette. Dark mode uses the near-black palette and is available from the theme switch. Roboto is hosted locally. The pages do not use an icon library or icon CDN: navigation uses a Unicode menu glyph, the theme control uses a small inline SVG, and project metadata and GitHub links use plain text.

## Navigation behavior

The desktop navigation shows the site name, Home, Projects, Contact, and the theme switch in one row. At widths up to 600px it collapses to the site name and menu button. Opening the button reveals Home, Projects, Contact, and the theme switch with its inline SVG. The button updates its accessible label and expanded state as it opens or closes. The current page is marked with a thin blue underline. Keep the expanded-menu `display: block` rule in sync with the collapsed rule that hides links after the brand.

The nav toggle is `responsiveNav()` in `js/script.js`; its `responsive` class controls the expanded mobile layout. Theme preference is stored under the `theme` localStorage key and applied to the root element's `data-theme` attribute.

## Content maintenance

Resume and project content is maintained directly in HTML and is duplicated in places. The primary Experience and Education entries on the home page reflect `/home/fletcher/Documents/Resumes/FH_USA_Resume.tex`. The Skills section extends that resume with additional frameworks and confirmed Linux, Docker networking, DevContainer, and homelab experience. Earlier Cerberus Capital Management and MT Soccer Club experience is kept in a native collapsed disclosure below the current resume entries. The old Achievements section was removed; only add recognition again if it becomes current and relevant. Project entries are repeated between the home and projects pages, so keep those copies aligned when editing them.

The repository's `Resume.pdf` has been replaced with `/home/fletcher/Documents/Resumes/FH_USA_Resume.pdf`. The PDF's header still uses old comcast email, while the website uses `contact@lo49.dev`.

## Suggested follow-up

- **Align contact details if desired.** The updated PDF has old comcast email; the website uses `contact@lo49.dev`.
- **Review the project list for relevance.** It includes older work not present in the newest resume. Keep the broader portfolio if those projects still represent work Fletcher wants to feature; otherwise prioritize a short set of current, technically representative projects.

Prefer concise role and accomplishment descriptions over a company-logo strip. Logos use space without explaining Fletcher's contribution, while the text treatment fits the lightweight resume layout.
