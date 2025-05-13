\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ementa}[2024/03/09 Ementa Engenharia UERJ]
% Adiciona o diretório pai ao caminho de busca
\makeatletter
\def\input@path{{../}}
\makeatother
% Carrega pacotes do diretório pai
\RequirePackage{disciplinasDB}
% Restaura o comportamento padrão
\makeatletter
\def\input@path{{}}
\makeatother

\LoadClass[12pt,a4paper]{article}
% Pacotes necessários
\RequirePackage{calc} %serve para fazer certas contas simples
\RequirePackage[left=2.48cm,right=1.7cm,top=1.35cm,marginparwidth=3.4cm]{geometry} % Adjust page margins
\RequirePackage{tabularx} % Ambiente de tabelas
\RequirePackage{fancyhdr} % Required to customize headers
\RequirePackage[utf8]{inputenc}
\RequirePackage[portuguese]{babel}
\RequirePackage{csquotes}
\RequirePackage{ifthen}
\RequirePackage[defernumbers=true, backend=biber, sorting=none]{biblatex} %bibliografia
\RequirePackage{tikz}
\usetikzlibrary{positioning,shapes,shadows,arrows,calc,matrix}

\RequirePackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage[sfdefault,lf]{carlito}
\renewcommand{\familydefault}{\sfdefault} % Define Carlito como a fonte padrão
\RequirePackage{multirow} % Required for multirows
\RequirePackage{array}
\RequirePackage{colortbl}

%----------------------------------------------------------------------------------------
\setlength{\headheight}{80pt} % Increase the size of the header to accommodate meta-information
\pagestyle{fancy}\fancyhf{} % Use the custom header specified below
\renewcommand{\headrulewidth}{0pt} % Remove the default horizontal rule under the header

%----------------------------------------------------------------------------------------
\nocite{*} %Não coloca a palavra bibliografia
\bibliography{bibliografia}{}

\makeatletter % Permite a criação de novos comandos

% Dewfine citações
\renewcommand\@cite[2]{%
  Ref.~#1\ifthenelse{\boolean{@tempswa}}
  {, \nolinebreak[3] #2}{}
}
\renewcommand\@biblabel[1]{#1.}
\makeatother

%----------------------------------------------------------------------------------------
% HEADER 
% UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO
% FORMULÁRIO DE IDENTIFICAÇÃO DE DISCIPLINA
%----------------------------------------------------------------------------------------
\fancyheadoffset[L]{-4mm}
\fancyheadoffset[R]{-2mm}
\lhead{
  \raisebox{-0.26\height}{\includegraphics[height=20.4mm,keepaspectratio]{../imagens/logo_uerj_cor.png}}}
\chead{\raisebox{2.2mm} {\large{UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO}}\\

  \large{FORMULÁRIO DE IDENTIFICAÇÃO DE DISCIPLINA}}
\rhead{\raisebox{0.09\height}{\includegraphics[height=13mm,keepaspectratio]{../imagens/pr1}}}

% Definiçṍes
% Define o departamento
\newcommand \departamento[1] {%
  \ifx&#1&%
  \newcommand \idepartamento {} %
  \else
  \newcommand \idepartamento{#1}%
  \fi}

% Define o curso
\newcommand \curso[1] {%
  \ifx&#1&%
  \newcommand \icurso {}%
  \else
  \newcommand \icurso{#1}%
  \fi}

% Define que a disciplina é obrigatória no curso
\newcommand \naoobrigatoria	{
  \newcommand{\obrigatoria}{}%
} %disciplina é obrigatória? 

% Define que a disciplina é eletiva restrita no curso
\newcommand \eletivarestrita[1] {%
  \newcommand{\irestrita}{x}%
  \ifx&#1&%
  \newcommand \icursorestrita {Engenharia de Computação (Versão 1)}%
  \else
  \newcommand \icursorestrita {#1}%
  \fi}

% Define que a disciplina é eletiva definida no curso
\newcommand \eletivadefinida[1] {%
  \newcommand{\idefinida}{x}%
  \ifx&#1&%
  \newcommand \icursodefinida {ERRO}%
  \else
  \newcommand \icursodefinida {#1}%
  \fi}

% Define que a disciplina tem aprovação por frequência
\newcommand \aprovadofrequencia	{
  \newcommand{\frequencia}{x}%
} %Se aprovação for por frequência, marcar x.


\newcommand {\semipresencial}{%
  \newcommand{\isemipresencial}{x}%
}

\newcommand \adistancia{%
  \newcommand{\iadistancia}{x}%
}

\newcommand \permiteempreparo	{
  \newcommand \empreparosim{x} % Permite situação em preparo?
}

\newcommand \naopermitemaisdeumdocente	{
  \newcommand \maisdeumdocentenao	{x} %Permite mais de um docente? nao
}

\newcommand \permitehorarioincompleto	{
  \newcommand \horarioincompletosim	{x} %Permite
}

\newcommand \permiteconcomitancia	{
  \newcommand \concomitanciasim	{x} %Permite
}

\newcommand \disciplinaisolada	{
  \newcommand \isoladasim	{x} %Permite
}

\newcommand \travadecreditos[1]{
  \newcommand \itravadecreditos{#1} %Permite
}

\newcommand\ndisciplina[1]{%
  \ifx&#1&%
  \newcommand \indisciplina {0}%
  \else
  \newcommand \indisciplina {#1}%
  \fi}

\newcommand\codigo[1]{%
  \ifx&#1&%
  \newcommand \icodigo {FEN06-XXXXX}%
  \else
  \newcommand \icodigo {#1}%
  \fi}

\newcommand\nomeprofessor[1]{%
  \ifx&#1&%
  \newcommand \inomeprofessor {}%
  \else
  \newcommand \inomeprofessor {#1}%
  \fi}

\newcommand\matriculaprofessor[1]{%
  \ifx&#1&%
  \newcommand \imatriculaprofessor {}%
  \else
  \newcommand \imatriculaprofessor {- Mat. #1}%
  \fi}

\newcommand\preum[1]{%
  \ifx&#1&%
  \newcommand \ipreum {0}%
  \else
  \newcommand \ipreum {#1}%
  \fi}
\newcommand\codpreum[1]{%
  \ifx&#1&%
  \newcommand \icodpreum {0}%
  \else
  \newcommand \icodpreum {#1}%
  \fi}

\newcommand\predois[1]{%
  \ifx&#1&%
  \newcommand \ipredois {0}%
  \else
  \newcommand \ipredois {#1}%
  \fi}

\newcommand\codpredois[1]{%
  \ifx&#1&%
  \newcommand \icodpredois {0}%
  \else
  \newcommand \icodpredois {#1}%
  \fi}

\newcommand\objetivos[1]{%
  \ifx&#1&%
  \newcommand \iobjetivos {}%
  \else
  \newcommand \iobjetivos {#1}%
  \fi}

\newcommand\ementa[1]{%
  \ifx&#1&%
  \newcommand \iementa {}%
  \else
  \newcommand \iementa {#1}%
  \fi}

\newcommand\credteorica[1]{%
  \ifx&#1&%
  \newcommand \crteorica {0}%
  \else
  \newcommand \crteorica {#1}%
  \fi}

\newcommand\credpratica[1]{%
  \ifx&#1&%
  \newcommand \crpratica {0}%
  \else
  \newcommand \crpratica {#1}%
  \fi}

\newcommand\credlab[1]{%
  \ifx&#1&%
  \newcommand \crlab {0}%
  \else
  \newcommand \crlab {#1}%
  \fi}

\newcommand\credestagio[1]{%
  \ifx&#1&%
  \newcommand \crestagio {0}%
  \else
  \newcommand \crestagio {#1}%
  \fi}

\newcommand\credextensao[1]{%
  \ifx&#1&%
  \newcommand \crextensao {0}%
  \else
  \newcommand \crextensao {#1}%
  \fi}

\newcommand\chta[1]{%carga horária total aluno
  \ifx&#1&%
  \newcommand \ichta {0}%
  \else
  \newcommand \ichta {#1}%
  \fi}

\newcommand\chtp[1]{%carga horária total professor
  \ifx&#1&%
  \newcommand \ichtp {0}%
  \else
  \newcommand \ichtp {#1}%
  \fi}

\newcommand{\option}[1]{%
  \begin{minipage}[m]{5cm} \tikz \node[draw, rectangle, inner sep=0pt, minimum width=10mm, minimum height=8.7mm]{\huge{#1}} ;\end{minipage}
}

% inicio defaults*******************************************

\newcommand \euniversal	{} %disciplina é eletiva universal? marcar x
\newcommand \cursouniversal{}

%fim defaults

\newcommand*{\formementa}[1]{
  \headsep = 1pt
  %contadores
  \newcounter{numcr}
  \newcounter{chteoricatotal}
  \newcounter{chprattotal}
  \newcounter{chlabtotal}
  \newcounter{chlabsemanal}
  \newcounter{chpratsemanal}
  \newcounter{chestagiototal}
  \newcounter{chestagiosemanal}
  \newcounter{chextensaototal}
  \newcounter{chextensaosemanal}
  \newcounter{chtotalsemanal}
  \newcounter{chtotal}

  %\ifx\ialteracao\undefined
  %  \newcommand{\icriacao}{x}
  %  \newcommand{\ialteracao}{}
  %\else
  %  \newcommand{\icriacao}{}
  %\fi

  \ifx \idepartamento \undefined
    \newcommand \idepartamento {Engenharia de Sistemas e Computação}
  \fi

  \ifx\isemipresencial\undefined
    \ifx\iadistancia\undefined
      \newcommand{\ipresencial}{x}
      \newcommand{\isemipresencial}{}
      \newcommand{\iadistancia}{}
    \else
      \newcommand{\ipresencial}{}
      \newcommand{\isemipresencial}{}
    \fi
  \else %curso semipresencial
    \newcommand{\ipresencial}{}
    \newcommand{\iadistancia}{}
  \fi

  \ifx\frequencia\undefined
    \newcommand{\frequencia}{}
    \newcommand{\frequenciaenota}{x}
  \else
    \newcommand{\frequenciaenota}{}
  \fi

  \ifx\horarioincompletosim\undefined
    \newcommand{\horarioincompletosim}{}
    \newcommand{\horarioincompletonao}{x}
  \else
    \newcommand{\horarioincompletonao}{}
  \fi

  \ifx\concomitanciasim\undefined
    \newcommand{\concomitanciasim}{}
    \newcommand{\concomitancianao}{x}
  \else
    \newcommand{\concomitancianao}{}
  \fi

  \ifx\empreparosim\undefined
    \newcommand{\empreparonao}{x}
    \newcommand{\empreparosim}{}
  \else
    \newcommand{\empreparonao}{}
  \fi

  \ifx\maisdeumdocentesim\undefined
    \newcommand{\maisdeumdocentenao}{x}
    \newcommand{\maisdeumdocentesim}{}
  \else
    \newcommand{\maisdeumdocentesim}{}
  \fi

  \ifx\isoladasim\undefined
    \newcommand{\isoladasim}{}
    \newcommand{\isoladanao}{x}
  \else
    \newcommand{\isoladanao}{}
  \fi

  \ifx\icursodefinida\undefined
    \newcommand{\icursodefinida}{}
    \ifx\idefinida\undefined
      \newcommand{\idefinida}{}
    \fi
  \fi

  \ifx\irestrita\undefined
    \newcommand{\irestrita}{}
  \fi

  \ifx\icursorestrita\undefined
    \newcommand{\icursorestrita}{}
  \fi

  \ifx\itravadecreditos\undefined
    \newcommand{\itravadecreditos}{}
  \fi

  \ifx\obrigatoria\undefined
    \newcommand{\obrigatoria}{x}
    \ifx\icurso\undefined
      \newcommand{\icurso}{\small Engenharia de Computação (Versão 1)}
    \fi
  \else
    \newcommand{\icurso}{}
  \fi

  \ifx \crpratica \undefined
    \newcommand \crpratica {0}
  \fi

  \ifx \crteorica \undefined
    \newcommand \crteorica {0}
  \fi

  \ifx \crlab \undefined
    \newcommand \crlab {0}
  \fi

  \ifx \crestagio \undefined
    \newcommand \crestagio {0}
  \fi

  \ifx \crextensao \undefined
    \newcommand \crextensao {0}
  \fi

  \ifx \indisciplina \undefined
    \newcommand \indisciplina {}
  \fi

  \ifx \icodigo \undefined
    \newcommand \icodigo {FEN 06-XXXXX}
  \fi

  \ifx \ipreum \undefined
    \newcommand \ipreum {}
    \newcommand \icodpreum {}
  \else
    \ifx \icodpreum \undefined
      \newcommand \icodpreum {}
    \fi
  \fi

  \ifx \ipredois \undefined
    \newcommand \ipredois {}
    \newcommand \icodpredois {}
  \else
    \ifx \icodpredois \undefined
      \newcommand \icodpredois {}
    \fi
  \fi

  \ifx \iobjetivos \undefined
    \newcommand \iobjetivos {}
  \fi

  \ifx \iementa \undefined
    \newcommand \iementa {}
  \fi

  \ifx \inomeprofessor \undefined
    \newcommand \inomeprofessor {}
  \fi

  \ifx \imatriculaprofessor \undefined
    \newcommand \imatriculaprofessor {}
  \fi

  \ifx \ichta \undefined
    \newcommand \ichta {}
  \fi

  \ifx \ichtp \undefined
    \newcommand \ichtp {\ichta}
  \fi

  \setcounter		{numcr}{0}

  \addtocounter		{numcr}{\crteorica}
  \addtocounter		{numcr}{\crlab}
  \addtocounter		{numcr}{\crestagio}
  \addtocounter		{numcr}{\crpratica}
  \addtocounter		{numcr}{\crextensao}

  \setcounter		{chteoricatotal}{15*\crteorica}
  \setcounter		{chlabtotal}{15*\crlab}
  \setcounter		{chestagiototal}{15*\crestagio}
  \setcounter		{chextensaototal}{15*\crextensao}
  \setcounter		{chprattotal}{15*\crpratica}

  \setcounter		{chlabsemanal}{\crlab}
  \setcounter		{chpratsemanal}{\crpratica}
  \setcounter		{chestagiosemanal}{\crestagio}
  \setcounter		{chextensaosemanal}{\crextensao}

  \setcounter		{chtotalsemanal}{0}
  \setcounter		{chtotalsemanal}{\crlab}
  \addtocounter		{chtotalsemanal}{\crestagio}
  \addtocounter		{chtotalsemanal}{\crextensao}
  \addtocounter		{chtotalsemanal}{\crpratica}
  \addtocounter		{chtotalsemanal}{\crteorica}

  \setcounter		{chtotal}{0}
  \setcounter		{chtotal}{\the\value{chprattotal}+\the\value{chestagiototal}+\the\value{chextensaototal}+\the\value{chlabtotal}+\the\value{chteoricatotal}}
  \flushleft


  \setlength{\parindent}{0cm} % Remove paragraph indentation
  \setlength{\tabcolsep}{5pt} % Espaço horizontal
  \vspace*{1.0mm}

  \renewcommand{\arraystretch}{1.4}
  \setlength{\arrayrulewidth}{0.5pt}
  \footnotesize % Tamanho da fonte
  % Quadro 1 UNIDADE, DEPARTAMENTO, DISCIPLINA, CH TOTAL, CRÉDITOS, CÓDIGO
  \begin{tabular}{|m{1.87cm}|m{1.87cm}|m{3.86cm}|m{7.64cm}|}
    \hline
    \multicolumn{4}{|l|} {
      {
          \textbf{UNIDADE:} Faculdade de Engenharia
    } \rule[-2ex]{0pt}{8.45mm}}                      \\
    \hline
    \multicolumn{4}{|l|}
    {
      \textbf{DEPARTAMENTO:} {\idepartamento}
    }\rule[-2ex]{0pt}{8.45mm}                        \\
    \hline
    \multicolumn{4}{|l|}
    {
      \textbf{DISCIPLINA:} {\indisciplina}
    } \rule[-2ex]{0pt}{8.45mm}                       \\
    \hline
    \multicolumn{2}{|c|}
    {
      \textbf{CH. TOTAL}
    }
     & {
        \textbf{CRÉDITOS:}
      }
     & {
        \textbf{CÓDIGO:}
    }                                                \\
    \cline{1-2}
    {\hspace{4mm}\textbf{ALUNO}}
     &
    {\hspace{1mm}\textbf{PROFESSOR}}
     &
    \large $\the\value{numcr}$
     &
    \large \icodigo
    \\
    \cline{1-2}
    \large $\ichta$
     & {\large $\ichtp$}
     & {}                & {}\rule[-2ex]{0pt}{8.8mm} \\ %
    \hline
  \end{tabular}

  \vspace*{0.385cm}

  % Quadro 2 MODALIDADE DE ENSINO, TIPO DE APROVAÇÃO
  \begin{tabular}{m{4.14cm} m{0.8cm}m{2.75cm}m{0.8cm}m{3.1cm}m{0.7cm}m{2.3cm}}
    \textbf{MODALIDADE DE ENSINO:}
     & \option{\ipresencial}     & \textbf{PRESENCIAL}
     & \option{\isemipresencial} & \textbf{SEMIPRESENCIAL}
     & \option{\iadistancia}     & \textbf{ A DISTÂNCIA}   \\
  \end{tabular}
  \vspace*{0.35cm}

  \begin{tabular}{m{4.14cm} m{0.8cm}m{2.75cm}m{0.8cm}m{3.1cm}m{0.7cm}m{2.3cm}}
    \textbf{TIPO DE APROVAÇÃO:}
     & \option{\frequencia}      & \textbf{FREQUÊNCIA}
     & \option{\frequenciaenota} & \textbf{FREQUÊNCIA E NOTA} \\
  \end{tabular}
  \vspace*{0.385cm}

  % Quadro 3 STATUS
  \renewcommand{\arraystretch}{2}
  \begin{tabular}{ | m{0.63cm} | m{3.615cm}  | m{11.37cm}|}
    \hline
    \rowcolor[gray]{.9}
    \multicolumn{2}{|l|}
    {
      \textbf{STATUS}
    }
     & {\textbf{CURSO(S) / HABILITAÇÃO(ÕES) / ÊNFASE(S):}} \\
    \hline
    {\huge \obrigatoria}
     & \textbf{OBRIGATÓRIA}
     & {\icurso}                                           \\
    \hline
    {\huge  \irestrita}
     & \textbf{ELETIVA RESTRITA}
     & {\icursorestrita}                                   \\
    \hline
    {\huge  \idefinida}
     & \textbf{ELETIVA DEFINIDA}
     & {\icursodefinida}                                   \\ %
    \hline
    {\huge  \euniversal}
     & \textbf{ELETIVA UNIVERSAL}                          \\
    \cline{1-2}
  \end{tabular}

  \vspace*{6.2mm}

  % Quadro 4 Distribuição de Carga Horária / Crédito

  \begin{center}
    {\normalsize \textbf{QUADRO DE DISTRIBUIÇÃO DE CARGA HORÁRIA / CRÉDITO}\vspace*{-1.9pt}}
  \end{center}

  \begin{tabular}{ | m{8.135cm} | m{2.385cm}| m{2.385cm} | m{2.385cm}|}
    \hline
    \rowcolor[gray]{.9}
    \hspace{29.5mm} \textbf{TIPO DE AULA}
     & \hspace{4.5mm} \textbf{CRÉDITO}
     & \hspace{2.5mm}\textbf{CH SEMANAL}
     & \hspace{4.5mm}\textbf{CH TOTAL}                      \\
    \hline
    TEÓRICA
     & \multicolumn{1}{c|}{$\crteorica$}
     & \multicolumn{1}{c|}{$\crteorica$ }
     & \multicolumn{1}{c|}{$\the\value{chteoricatotal}$}    \\
    \hline
    PRÁTICA / TRABALHO DE CAMPO / PRÁTICA COMO \mbox{COMPONENTE CURRICULAR}
     & \multicolumn{1}{c|}{$\crpratica$}
     & \multicolumn{1}{c|}{$\the\value{chpratsemanal}$}
     & \multicolumn{1}{c|}{$\the\value{chprattotal}$}       \\
    \hline
    LABORATÓRIO
     & \multicolumn{1}{c|}{$\crlab$}
     & \multicolumn{1}{c|}{$\the\value{chlabsemanal}$}
     & \multicolumn{1}{c|}{$\the\value{chlabtotal}$}        \\
    \hline
    ESTÁGIO
     & \multicolumn{1}{c|}{$\crestagio$}
     & \multicolumn{1}{c|}{$\the\value{chestagiosemanal}$}
     & \multicolumn{1}{c|}{$\the\value{chestagiototal}$}    \\
    \hline
    EXTENSÃO
     & \multicolumn{1}{c|}{$\crextensao$}
     & \multicolumn{1}{c|}{$\the\value{chextensaosemanal}$}
     & \multicolumn{1}{c|}{$\the\value{chextensaototal}$}   \\
    \hline
    \multicolumn{1}{|r|}{\textbf{TOTAL}}
     & \multicolumn{1}{c|}{$\the\value{numcr}$}
     & \multicolumn{1}{c|}{$\the\value{chtotalsemanal}$}
     & \multicolumn{1}{c|}{$\the\value{chtotal}$ }          \\
    \hline
  \end{tabular}
  \vspace{1.5mm}

  \def\tamanholinha{16.8cm}
  \renewcommand{\arraystretch}{2.6}

  % Quadro 5 Ementa e Objetivos
  \begin{tabularx}{\tamanholinha}{ |X| }
    \hline
    \textbf{EMENTA:} {\small \iementa} \\
    \hline
  \end{tabularx}
  \vspace{2mm}

  \begin{tabularx}{\tamanholinha}{ |X| }
    \hline
    \textbf{OBJETIVOS:} {\small \iobjetivos} \\
    \hline
  \end{tabularx}
  \vspace{2mm}


  \vspace{10mm}

  \begin{tabularx}{\tamanholinha}{ |m{12.28cm}|X| }
    \hline
    \textbf{PRÉ-REQUISITO 1:} {\small \ipreum}   & \textbf{CÓDIGO:} {\small \icodpreum}   \\
    \hline
    \textbf{PRÉ-REQUISITO 2:} {\small \ipredois} & \textbf{CÓDIGO:} {\small \icodpredois} \\
    \hline
    \textbf{CÓ-REQUISITO:}                       & \textbf{CÓDIGO:}                       \\
    \hline
    \textbf{PRÉ-CÓ-REQUISITO:}                   & \textbf{CÓDIGO:}                       \\
    \hline
    \textbf{TRAVA DE CRÉDITOS/HORAS:} {{\large \itravadecreditos} }                       \\
    \cline{1-1}
  \end{tabularx}

  \vspace{7.5mm}
  \begin{tabularx}{\tamanholinha}{ |m{12.28cm}|X| }
    \hline
    \textbf{DISCIPLINA(S) CORRESPONDENTE(S)} & \textbf{CÓDIGO(S):} \\
    \hline
  \end{tabularx}

  \vspace{2mm}
  \begin{tabularx}{\tamanholinha}{ |X| }
    \hline
    \textbf{BIBLIOGRAFIA:} { \printbibliography[heading=none, resetnumbers=true, keyword=#1, notsubtype=ref]
      \small \printbibliography[title={\small Referências}, keyword=#1, subtype=ref]
    } \\
    \hline
  \end{tabularx}

  \vspace{2mm}


  \begin{center}
    {\normalsize \textbf{SITUAÇÕES ESPECIAIS}}
  \end{center}

  \begin{tabular}{m{11.7cm}m{0.8cm}m{1cm}m{0.8cm}m{1cm}}
    \textbf{PERMITE SITUAÇÃO ``EM PREPARO'' DE ACORDO COM A DELIBERAÇÃO 27/03:}
     & \option{\empreparosim} & \textbf{SIM}
     & \option{\empreparonao} & \textbf{NÃO} \\
  \end{tabular}

  \vspace{2mm}
  \begin{tabular}{m{11.7cm}m{0.8cm}m{1cm}m{0.8cm}m{1cm}}
    \textbf{PERMITE MAIS DE UM DOCENTE EM UM MESMO TEMPO DE AULA:}
     & \option{\maisdeumdocentesim} & \textbf{SIM}
     & \option{\maisdeumdocentenao} & \textbf{NÃO} \\
  \end{tabular}

  \vspace{2mm}
  \begin{tabular}{m{11.7cm}m{0.8cm}m{1cm}m{0.8cm}m{1cm}}
    \textbf{PERMITE HORÁRIOS INCOMPLETOS NO PT: }
     & \option{\horarioincompletosim} & \textbf{SIM}
     & \option{\horarioincompletonao} & \textbf{NÃO} \\
  \end{tabular}

  \vspace{2mm}
  \begin{tabular}{m{11.7cm}m{0.8cm}m{1cm}m{0.8cm}m{1cm}}
    \textbf{PERMITE CHOQUE DE HORÁRIOS COM OUTRA DISCIPLINA: }
     & \option{\concomitanciasim} & \textbf{SIM}
     & \option{\concomitancianao} & \textbf{NÃO} \\
  \end{tabular}

  \vspace{4pt}
  \begin{tabular}{m{11.7cm}m{0.8cm}m{1cm}m{0.8cm}m{1cm}}
    \textbf{PODE SER OFERECIDA COMO DISCIPLINA ISOLADA:}
     & \option{\isoladasim} & \textbf{SIM}
     & \option{\isoladanao} & \textbf{NÃO} \\
  \end{tabular}



  % Professor Proponente
  \raggedright
  \begin{flushright}
    \begin{tabular}{|m{2.9cm}|m{7.88cm}|}
      \hline
      \multicolumn{2}{|c|}
      {
        \textbf{PROFESSOR PROPONENTE}
      }                                                                         \\
      \hline
      \multicolumn{1}{|c|} {\textbf{DATA} }
       & \multicolumn{1}{c|} {\textbf{{\textbf{ASSINATURA/MATRÍCULA/CARIMBO}}}} \\
      {\today}
       & {}                                                                     \\
      {}
       & \multicolumn{1}{c|} { \inomeprofessor\ \imatriculaprofessor}           \\
      \hline
    \end{tabular}
  \end{flushright}




}
\endinput
%------------------------------------------------------------------------------------
