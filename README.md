# Thesis

This directory contains the print-book edition of the thesis.

## Initial design

- 7 x 10 inch trim size
- Two-sided, open-right book layout
- Libertinus text and mathematics
- KOMA-Script page and heading styles
- No interior bleed
- 22 mm inner and 18 mm outer margins

## Build

All thesis content is maintained in `thesis.tex`. Build the complete manuscript
with:

```sh
make
```

Continuously rebuild the complete manuscript:

```sh
make watch
```

Remove auxiliary build files while preserving `thesis.pdf`:

```sh
make clean
```

The build requires LuaLaTeX, BibTeX, and latexmk.

The complete thesis is maintained as a single TeX document.
