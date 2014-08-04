LATEX=platex
BIBTEX=pbibtex
DVIPDF=dvipdfmx
PANDOC=pandoc
RM=rm
BB=extractbb
OUTPUT=mm-practice-midterm
SOURCES=$(OUTPUT).tex $(shell find ./src -name "*.tex")
IMAGES=$(shell find ./img -name "*.png")
IMAGE_XBBS=$(IMAGES:.png=.xbb)

.SUFFIXES: .tex .pdf .xbb .png
.PHONY: all clean semiclean open

all: $(OUTPUT).pdf

.png.xbb:
	$(BB) $<

$(OUTPUT).pdf: $(SOURCES) $(IMAGES) $(IMAGE_XBBS) references.bib
	$(LATEX) $*
	$(BIBTEX) $*
	$(LATEX) $*
	$(LATEX) $*
	$(DVIPDF) $*

semiclean: 
	-$(RM) *.aux *.log *.dvi *.toc *.blg *.bbl chapter*.tex *.tex-e
	-$(RM) ./src/*.tex-e
	-$(RM) ./img/*.xbb

clean: semiclean
	-$(RM) *.pdf *~

open: $(OUTPUT).pdf
	open $(OUTPUT).pdf
