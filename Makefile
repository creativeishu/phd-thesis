FILENAME := thesis
TEXBIN ?= /usr/local/texlive/2026/bin/universal-darwin
FIGURES := $(shell find figures -type f)

export PATH := $(TEXBIN):$(PATH)
export TEXMFVAR := /tmp/phd-luatex-cache
export TEXMFCACHE := /tmp/phd-luatex-cache

.PHONY: all watch clean

all: $(FILENAME).pdf

$(FILENAME).pdf: $(FILENAME).tex bookstyle.sty aas_macros.sty mn2e.bst bibliography.bib $(FIGURES)
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -lualatex -interaction=nonstopmode -halt-on-error $(FILENAME).tex

watch:
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -pvc -view=none -lualatex -interaction=nonstopmode -halt-on-error $(FILENAME).tex

clean:
	PATH="$(TEXBIN):$$PATH" $(TEXBIN)/latexmk -c $(FILENAME).tex
	$(RM) $(FILENAME).bbl
