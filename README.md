# Distribution of Matter in the Universe

This repository contains the print-book edition of my PhD thesis,
*Distribution of Matter in the Universe: From Lensing Clusters to Large-Scale
Structure*. I submitted the original dissertation to the Faculty of Science at
the University of Zurich in 2015 for the degree of Doctor of Natural Sciences
(`Dr. sc. nat.`).

The thesis studies how matter is distributed across two complementary regimes:
gravitationally bound galaxy clusters and the large-scale structure of the
Universe. Its main themes include strong and weak gravitational lensing,
dark-matter substructure, cluster mass reconstruction, lensing time delays,
the matter power spectrum, and the effect of baryonic physics on cosmological
measurements.

## Contents

The book contains front matter in English and German, followed by seven
numbered chapters:

1. **Introduction**: cosmology, structure formation, the matter power spectrum,
   and gravitational lensing.
2. **Mass--Galaxy Offsets in Lensing Clusters**: non-parametric strong-lensing
   reconstructions and offsets between mass peaks and cluster galaxies.
3. **An Analytic Model for the Matter Power Spectrum**: a computationally
   efficient model calibrated against cosmological simulations.
4. **Baryonic Effects on Weak-Lensing Two-Point Statistics**: the influence of
   baryonic processes on weak-lensing observables and cosmological inference.
5. **Lensing Time Delays as a Substructure Constraint**: using time delays to
   constrain asymmetry and substructure in cluster lenses.
6. **Quantifying Substructures in Hubble Frontier Field Clusters**: mass-map
   reconstructions and power-spectrum measurements for six clusters.
7. **Conclusions**: a synthesis of the cluster- and large-scale results.

Chapters 2--6 each introduce and reproduce one of the five scientific papers
that form the core of the dissertation. All chapters and references are kept
in a single master file, [`thesis.tex`](thesis.tex).

## Manuscript Statistics

These counts describe the current repository and may change as the book is
revised:

| Item | Count |
| --- | ---: |
| Compiled pages | 188 |
| Numbered chapters | 7 |
| Sections | 43 |
| TeX source lines | 6,603 |
| Manuscript words reported by TeXcount | 50,308 |
| Figure environments | 47 |
| Graphics included in the manuscript | 162 |
| Figure files stored in the repository | 190 |
| Table environments | 4 |
| Displayed equation environments | 152 |
| Bibliography records available | 311 |
| References rendered in the bibliography | 308 |

The TeXcount total includes body text, headings, and captions. The graphics
count is larger than the number of figure environments because many figures
contain multiple panels.

## Book Design

The manuscript is formatted as a two-sided, open-right book:

- 7 x 10 inch trim size
- 11-point Libertinus text and mathematics
- KOMA-Script `scrbook` document class
- 22 mm inner and 18 mm outer margins
- no interior bleed
- running heads and mirrored page layout for print binding
- one combined bibliography for the complete thesis

The document begins with German and English title pages, author and copyright
information, a dedication, the table of contents, acknowledgements, English
and German abstracts, and an epigraph. Arabic page numbering begins with the
acknowledgements.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `thesis.tex` | Complete thesis, including all chapters and front matter |
| `bookstyle.sty` | Page geometry, typography, headings, and book styling |
| `bibliography.bib` | Combined BibTeX database |
| `figures/` | Introduction and paper figures, grouped by chapter |
| `aas_macros.sty` | Astronomy journal and symbol macros |
| `mn2e.bst` | Bibliography style |
| `Makefile` | Build, continuous-preview, and cleanup commands |
| `.latexmkrc` | LuaLaTeX and latexmk configuration |
| `thesis.pdf` | Latest compiled book |

## Building the Thesis

The build requires a TeX Live installation containing:

- LuaLaTeX
- BibTeX
- latexmk

The `Makefile` currently defaults to the TeX Live 2026 installation at:

```text
/usr/local/texlive/2026/bin/universal-darwin
```

To compile the complete thesis:

```sh
make
```

To continuously rebuild whenever a source file or figure changes:

```sh
make watch
```

To remove auxiliary files while preserving the final `thesis.pdf`:

```sh
make clean
```

For a TeX installation in another location, override `TEXBIN`:

```sh
make TEXBIN=/path/to/texlive/bin
```

The build always compiles the full manuscript from `thesis.tex`; individual
chapters and title pages are not built separately.
