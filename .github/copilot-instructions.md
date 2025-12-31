# AI Coding Agent Instructions — PostgreSQL‑Anonymizer‑Conference

Concise, actionable guidance to be immediately productive in this repo.

## Big Picture
- Purpose: A conference slide deck built with Asciidoctor Reveal.js.
- Flow: Author slides in AsciiDoc → build HTML via Docker → view `index.html` in browser.
- Vendored `reveal.js`: Present under [reveal.js](reveal.js). Do not modify core library unless absolutely necessary.

## Structure & Key Files
- Entry deck: [index.adoc](index.adoc) — sets global attributes (theme, width, CSS) and `include`s slide files.
- Slides: [1-intro.adoc](1-intro.adoc) — example slide source using Asciidoctor blocks/classes.
- Output: [index.html](index.html) — generated file opened in a browser.
- Styling: [css/custom.css](css/custom.css) — overrides theme variables and adds project branding.
- Assets: [images/](images) — slide backgrounds, logos, speaker photo.
- Library: [reveal.js/README.md](reveal.js/README.md) — docs for the upstream presentation engine.

## Build & Preview
- VS Code task: Run `buildSlides` to generate `index.html` using Docker (asciidoctor-revealjs), mounting the workspace.
- Equivalent CLI (Linux/macOS): `docker run --rm -v "$PWD":/documents asciidoctor/docker-asciidoctor asciidoctor-revealjs index.adoc`
- README example (Windows Git Bash): uses `$(pwd -W)` for path normalization.
- After build: open [index.html](index.html) in a browser.

## Authoring Slides (AsciiDoc + Reveal.js)
- Central config in [index.adoc](index.adoc) via attributes: theme, slide numbers, history, width, PDF fragments, `:customcss:`.
- Add new slide files alongside [1-intro.adoc](1-intro.adoc); include them from [index.adoc](index.adoc) using `include::my-slides.adoc[]`.
- Use roles/classes to control layout/animation, e.g. `[%auto-animate.columns.is-vcentered.transparency]` as in [1-intro.adoc](1-intro.adoc).
- Backgrounds: `image::...[]` with role `background` and `size=fill` to set slide backgrounds.
- Code highlighting: `:source-highlighter: highlight.js` is enabled in [index.adoc](index.adoc); prefer fenced blocks or Asciidoctor source blocks.

## Slide Sections & Naming
- Sections: Place each major section in a separate `.adoc` file prefixed by a number, e.g. [2-content.adoc](2-content.adoc), [3-demo.adoc](3-demo.adoc), [4-conclusion.adoc](4-conclusion.adoc).
- First section: [1-intro.adoc](1-intro.adoc) is the first part of the conference.
- Include order: Add `include::N-section.adoc[]` entries in [index.adoc](index.adoc) in ascending numeric order to set the presentation flow.
- File naming: Use a short, kebab-cased topic after the number (no spaces) for clarity and stable ordering.
- Scope: Keep section-specific assets under [images/](images) and reuse shared styles from [css/custom.css](css/custom.css).
- Anchors: Avoid duplicate IDs/titles across sections to prevent collisions with history/slide numbering.

## Styling Conventions
- Theme overrides via CSS variables in [css/custom.css](css/custom.css): `--r-background-color`, `--r-main-color`, `--r-heading-font`, `--r-main-font`.
- Project brand color: `#6ABFAD` applied to progress bar, controls, and links.
- Global badge/logo via `body::after` in [css/custom.css](css/custom.css); asset is [images/logo_event.svg](images/logo_event.svg).
- Common utility classes used: `.transparency`, `.smaller`, `.rounded`; leverage in slide markup via role/class assignments.

## Reveal.js Integration Notes
- Prefer configuration via Asciidoctor attributes in [index.adoc](index.adoc) over editing reveal.js sources.
- If you need advanced features/plugins, consult [reveal.js/README.md](reveal.js/README.md) and configure through Asciidoctor attributes or minimal JS/CSS additions outside `reveal.js`.
- Never modify core reveal.js files to maintain upgradability.

## Documentation via Context7 MCP
- Use the Context7 MCP to retrieve up-to-date documentation for Reveal.js and AsciiDoc/Asciidoctor.
- Workflow: call `mcp_io_github_ups_resolve-library-id` with the library name (e.g., "reveal.js", "asciidoctor"), then call `mcp_io_github_ups_get-library-docs` using the returned Context7-compatible ID.
- Mode guidance: use `mode=info` for conceptual guides and `mode=code` for API references and examples; set `topic` (e.g., "plugins", "attributes", "asciidoctor-revealjs") and increment `page` as needed.
- Purpose: prefer this over ad-hoc web searches to ensure authoritative, version-aware references while keeping core `reveal.js` sources untouched.

## Workflows & Gotchas
- Docker is required for builds; the VS Code task uses `$LOCAL_WORKSPACE_FOLDER` for mounting the project.
- Keep `reveal.js` directory present at the root; the deck expects that path.
- Do not commit generated outputs from inside `reveal.js/dist`.
- Add images under [images/](images) and reference them with relative paths from slide files.

## Examples
- Include another slide file: add `include::2-content.adoc[]` to [index.adoc](index.adoc) and create [2-content.adoc](2-content.adoc).
- Set a slide background: `image::images/bg.png[background, size=fill]` in a slide block.
- Apply layout roles: `[%columns.is-vcentered]` followed by `=== My Slide` to get centered columns.

---
If any section is unclear or incomplete for your workflow, please reply with specifics (e.g., build environment, desired plugin usage) and I’ll refine these instructions.