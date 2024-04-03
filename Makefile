PP = ProjetoPedagogico.pdf
PPTEX = $(PP:%=%.pdf)
FLUXOGRAMA_TEX = fluxogramaEngenhariaComputacao.tex
FLUXOGRAMA_PDF = fluxogramaEngenhariaComputacao.pdf
DESC = 	AlgoritmosComputacionais 			AnaliseDeAlgoritmos 		ComputacaoParalela 			ArquiteturaDeComputadores \
		ControleDeProcessosPorComputador 	EngenhariaComputacional 	EngenhariaDeSistemas		EngenhariaDeComputacaoESociedade \
		EstagioSupervisionadoXIA			EstruturasDeInformacao		FundamentosDeComputadores 	InteligenciaComputacional \
		LaboratorioDeProgramacaoA			LaboratorioDeProgramacaoB 	LogicaEmProgramacao			MineracaoDeDados \
		ProcessamentoDeImagens				ProjetoDeSistemasOperacionais	ProjetoXIA		 	    ProjetoXIB \
		ProjetoEAdministracaoDeBancoDeDados SistemasEmbutidos			TeleprocessamentoERedes		TeoriaDeCompiladores \
		Eletiva1_ReconhecimentoDePadroes	Eletiva2_RedesDeInterconexao Eletiva3_Geomatica			Eletiva4_ComputacaoDeAltoDesempenho \
		Eletiva5_ProgramacaoParaDispositivosMoveis Eletiva6_Padroes
DESCPDF = $(DESC:%=%.pdf)

DISC_EXT = CircuitosEletricosI CircuitosEletricosII AnaliseDeSistemasFisicos EngenhariaDoTrabalhoI MateriaisEletricosEMagneticos \
			MetodosQuantitativos
DISC_EXT_PDF = $(DISC_EXT:%=%.pdf)

all: $(PP) $(FLUXOGRAMA_PDF) $(DESCPDF) $(DISC_EXT_PDF)

$(FLUXOGRAMA_PDF): $(FLUXOGRAMA_TEX)
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode" -use-make $<

.PHONY: all clean

$(DESCPDF): %.pdf: %.tex
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode" -use-make $<

$(DISC_EXT_PDF): %.pdf: %.tex
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode" -use-make $<

$(PP): $(TEX_FILE) $(DESCPDF)
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode" -use-make $(TEX_FILE)

clean:
	latexmk -C
	rm -f $(PP) $(DESCPDF) *.aux *.bbl *.blg *.fls *.log *.out *.fdb_latexmk *.synctex.gz *.toc *.lof *.lot *.lol *.run.xml *.bcf *.nav *.snm *.vrb
