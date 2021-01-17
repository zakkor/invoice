define(`BC', `syscmd(printf %.2f $(echo "print $1" | bc -l))')

\documentclass[10pt, a4paper]{article}
\usepackage{fontspec}
\usepackage[
  height=9in,      % height of the text block
  width=7in,       % width of the text block
  top=96pt,        % distance of the text block from the top of the page
  headheight=50pt, % height for the header block
  headsep=16pt,    % distance from the header block to the text block
  heightrounded,   % ensure an integer number of lines
  %showframe,      % show the main blocks
]{geometry}
\usepackage{fancyhdr}
\usepackage[style=ddmmyyyy,datesep=/]{datetime2}
\usepackage{enumitem}
\usepackage[dvipsnames]{xcolor}
\usepackage{fontspec}
\usepackage{tabularx}
 
\setmainfont{Roboto}
\setlength{\parindent}{0cm}
\pagenumbering{gobble}

% Header and footer
\pagestyle{fancy}
\fancyhead[L]{\rule[-2ex]{0pt}{0ex}\textcolor{MidnightBlue}{\textbf{\huge{FACTURĂ}}} \\ \rule[-2ex]{0pt}{0ex}Seria \textbf{INVOICESERIES} Nr. \textbf{INVOICENUMBER} din \textbf{\today}}
\fancyhead[R]{\ \\Scadentă la \textbf{\today}}
\fancyfoot[L]{\rule[-1.25ex]{0pt}{3.5ex}{\addfontfeature{LetterSpace=4.0}\textbf{PROVIDERCOMPANY}} \\ \footnotesize{Capital social: 200 RON;}}
\renewcommand{\headrulewidth}{.2mm} % header line width
\renewcommand{\footrulewidth}{.2mm} % footer line width

% \begin{document}\layout
\begin{document}

  \begin{minipage}[t]{.40\textwidth}
    \textcolor{MidnightBlue}{\textbf{FURNIZOR:}}
    \par
    \vspace{0.4em}
    \textbf{PROVIDERCOMPANY}
    \begin{itemize}[wide]
      \setlength\itemsep{-0.2em}
      \item[CIF:] \textbf{PROVIDERCIF}
      \item[Reg. com.:] \textbf{PROVIDERREGCOM}
      \item[Adresă:] \textbf{PROVIDERADDRESS}
      \item[Județ:] \textbf{PROVIDERCOUNTY}
      \item[IBAN:] \textbf{PROVIDERIBAN}
      \item[Bancă:] \textbf{PROVIDERBANK}
    \end{itemize}
  \end{minipage}
  \hspace{5em}
  \begin{minipage}[t]{.40\textwidth}
    \textcolor{MidnightBlue}{\textbf{CLIENT:}}
    \par
    \vspace{0.4em}
    \textbf{CLIENTCOMPANY}
    \begin{itemize}[wide]
      \setlength\itemsep{-0.2em}
      \item[CIF:] \textbf{CLIENTCIF}
      \item[Reg. com.:] \textbf{CLIENTREGCOM}
      \item[Adresă:] \textbf{CLIENTADDRESS}
      \item[Țară:] \textbf{CLIENTCOUNTRY}
    \end{itemize}
  \end{minipage}

  \vspace{3em}
  \textcolor{MidnightBlue}{\textbf{SERVICII:}}
  \par
  \vspace{1em}
  {\renewcommand{\arraystretch}{2.2}% for the vertical padding
  \begin{tabularx}{\textwidth}{ l X c c r r }
    \textbf{\#} & \textbf{Denumire} & \textbf{U.M.} & \textbf{Cant.} & \textbf{Pret unitar (USD)} & \textbf{Valoare (USD)} \\
    \hline
    1 & ITEMDESCRIPTION & ITEMUNIT & ITEMQTY & \$\,ITEMUNITPRICEUSD & \$\,BC(ITEMQTY*ITEMUNITPRICEUSD) \\
    \hline
  \end{tabularx}}
  \par
  \vspace{0.4em}
  \begingroup
    \footnotesize{Curs: \textbf{1 USD = CURRENCYEXCHANGERATEUSD Lei}}
  \endgroup
  \hfill
  {\renewcommand{\arraystretch}{1.2}% for the vertical padding
  \begin{tabular}{ l r r }
    \textbf{Total factură} & USD & \textbf{BC(ITEMQTY*ITEMUNITPRICEUSD)} \\
    \ & Lei & \textbf{BC(ITEMQTY*ITEMUNITPRICEUSD*CURRENCYEXCHANGERATEUSD)}
  \end{tabular}}
  
\end{document}