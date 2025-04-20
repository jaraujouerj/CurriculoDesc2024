# Nome do arquivo principal
MAIN = ProjetoPedagogico.tex
OUTPUT = ProjetoPedagogico.pdf
FLUXO = fluxogramaEngenhariaComputacao.tex
FLUXOPDF = fluxogramaEngenhariaComputacao.pdf
CAPITULOS = $(wildcard cap-*.tex) anexos.tex

# Diretório das ementas
EMENTAS_DIR = ementas

# Regra padrão
all: ementas $(FLUXOPDF) $(OUTPUT)

fluxo: $(FLUXOPDF)

# Regra para compilar o fluxograma
$(FLUXOPDF): $(FLUXO)
	lualatex $(FLUXO)

# Regra para executar o Makefile no diretório "ementas"
ementas:
	cd $(EMENTAS_DIR) && $(MAKE)

# Regra para compilar o arquivo principal
$(OUTPUT): $(MAIN) $(CAPITULOS)
	pdflatex $(MAIN)
	biber $(basename $(MAIN))
	pdflatex $(MAIN)
	pdflatex $(MAIN)

# Limpeza
clean:
	cd $(EMENTAS_DIR) && $(MAKE) clean
	rm -f $(basename $(MAIN)).aux $(basename $(MAIN)).log $(basename $(MAIN)).bbl $(basename $(MAIN)).blg $(basename $(MAIN)).out \
		  $(basename $(MAIN)).toc $(basename $(MAIN)).lof $(basename $(MAIN)).lot $(basename $(MAIN)).fls $(basename $(MAIN)).fdb_latexmk \
		  $(basename $(MAIN)).synctex.gz $(basename $(MAIN)).nav $(basename $(MAIN)).snm $(basename $(MAIN)).vrb
# rm -f $(FLUXOPDF)
