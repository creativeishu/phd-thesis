THESIS := thesis
COVER_DIR := cover
COVER_SOURCE := $(COVER_DIR)/cover-wrap.tex
COVER_BACKGROUND := $(COVER_DIR)/cover-wrap-background.png
COVER_INTERMEDIATE := $(COVER_DIR)/cover-wrap.pdf
COVER_PDF := $(COVER_DIR)/thesis-cover-wrap.pdf
COVER_PNG := /tmp/phd-thesis-cover-wrap-300dpi.png
COVER_RASTER_PDF := /tmp/phd-thesis-cover-wrap-raster.pdf
TEXBIN ?= /usr/local/texlive/2026/bin/universal-darwin
FIGURES := $(shell find figures -type f)

export PATH := $(TEXBIN):$(PATH)
export TEXMFVAR := /tmp/phd-luatex-cache
export TEXMFCACHE := /tmp/phd-luatex-cache

.PHONY: all thesis cover watch clean

all: thesis cover

thesis: $(THESIS).pdf

cover: $(COVER_PDF)

$(THESIS).pdf: $(THESIS).tex bookstyle.sty aas_macros.sty mn2e.bst bibliography.bib $(FIGURES)
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -lualatex -interaction=nonstopmode -halt-on-error $(THESIS).tex

$(COVER_PDF): $(COVER_SOURCE) $(COVER_BACKGROUND) $(THESIS).tex
	cd $(COVER_DIR) && PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -lualatex -interaction=nonstopmode -halt-on-error cover-wrap.tex
	gs -q -dNOSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r300 \
		-dFirstPage=1 -dLastPage=1 -o $(COVER_PNG) $(COVER_INTERMEDIATE)
	sips -s format pdf $(COVER_PNG) --out $(COVER_RASTER_PDF) >/dev/null
	gs -q -dNOSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.7 -dFIXEDMEDIA -dPDFFitPage \
		-dDEVICEWIDTHPOINTS=1183.536 -dDEVICEHEIGHTPOINTS=846 \
		-sOutputFile=$(COVER_PDF) $(COVER_RASTER_PDF)
	cd $(COVER_DIR) && PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -c cover-wrap.tex
	$(RM) $(COVER_INTERMEDIATE) $(COVER_PNG) $(COVER_RASTER_PDF)

watch:
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -pvc -view=none -lualatex -interaction=nonstopmode -halt-on-error $(THESIS).tex

clean:
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -c $(THESIS).tex
	cd $(COVER_DIR) && PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -c cover-wrap.tex
	$(RM) $(THESIS).bbl $(COVER_INTERMEDIATE) $(COVER_PNG) $(COVER_RASTER_PDF)
