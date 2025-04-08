TEXFILES := $(wildcard *.tex)
PDFFILES := $(TEXFILES:.tex=.pdf)

all: $(PDFFILES)

%.pdf: %.tex
	pdflatex $<
	biber $(basename $<)
	pdflatex $<
	pdflatex $<

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf  *.xml *.bcf *.run.xml *.fdb_latexmk *.fls *.synctex.gz

.PHONY: all clean