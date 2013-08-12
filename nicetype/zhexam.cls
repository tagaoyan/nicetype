\ProvidesClass{zhexam.cls}[2011/11/12 v1.0 Chinese Papers]
\LoadClass[a4paper,10pt]{article}
\RequirePackage[a4paper,body={15cm,22cm}]{geometry}
\RequirePackage{ifthen}

\RequirePackage{answers}
\def\ans{\jobname ans}
\Newassociation{sol}{Solution}{\ans}
\renewcommand{\Solutionlabel}[1]{\hgt{#1.\ }\kern0pt}
\renewenvironment{Solution}[1]
{\refstepcounter{Solution}\csname preSolution\endcsname \@nameuse{Solutionlabel}{#1}\setcounter{subquiz}{0}}
{\par\csname postSolution\endcsname\stepcounter{quiz}}

\newenvironment{exam}
{\Opensolutionfile{\ans}}
{\Closesolutionfile{\ans}}

\newcommand{\printsol}{\bgroup\fancyhead{}\Readsolutionfile{\ans}\egroup}

\def\lp{\leavevmode\par}


\newcounter{group}
\newcounter{quiz}
\newcounter{subquiz}[quiz]

\newlength{\tmplen}
\newcommand{\hgt}[1]{\settowidth{\tmplen}{#1}\noindent\hspace{-\tmplen}#1}

\newcommand{\ti}[2][]{\medskip\hgt{{\sffamily #1}}{\sffamily #2}\par\smallskip}
\newcommand{\group}[1]{\refstepcounter{group}\ti[\Chinese{group}、]{#1}\nopagebreak[8]}

\newcommand{\quiz}{\refstepcounter{quiz}\hgt{\arabic{quiz}.\ }\kern0pt}

\newcommand{\subquiz}{\stepcounter{subquiz}\noindent(\Roman{subquiz})}


\RequirePackage{multicol}
\RequirePackage{nicetype}

\newenvironment{zhlist}
{\list{$\bullet$}{\setlength{\itemsep}{0pt}\setlength{\topsep}{0pt}}}
{\endlist}

\newcounter{zhenum}
\newenvironment{zhenum}
{\list{\arabic{zhenum}.}{\usecounter{zhenum}\setlength{\itemsep}{0pt}\setlength{\topsep}{0pt}}}
{\endlist}

\newenvironment{guide}
{\CJKfamily{fs}}
{}

\newenvironment{cited}
{\CJKfamily{kai}}
{}

\newcommand{\optt}[4]{%
	\noindent\begin{tabu}{@{}XX}
	(A) #1 & (B) #2 \\
	(C) #3 & (D) #4 \\
	\end{tabu}
}
\newcommand{\optT}[4]{%
	\noindent\begin{tabu}{@{}X[c]X[c]}
	#1 & #2 \\
	(A) & (B) \\
	#3 & #4 \\
	(C) & (D) \\
	\end{tabu}
}
\newcommand{\optf}[4]{%
	\noindent\begin{tabu}{@{}XXXX}
	(A) #1 & (B) #2 & (C) #3 & (D) #4\\
	\end{tabu}
}
\newcommand{\optF}[4]{%
	\noindent\begin{tabu}{@{}X[c]X[c]X[c]X[c]}
	#1 & #2 & #3 & #4 \\
	(A)& (B)& (C)& (D)\\
	\end{tabu}
}
\newcommand{\opto}[4]{%
	\noindent(A) #1\\
	(B) #2\\
	(C) #3\\
	(D) #4\par
}
\newcommand{\ar}[1][2em]{\underline{\hspace{#1}}}
\newcommand{\filar}{\\\hbox{}\hfill\ar}
\newcommand{\tar}{\underline{\ $\blacktriangle$\ }}

% Title
\def\suptitle{}
\def\maintitle{}
\def\subtitle{}

\newcommand{\gentitle}{%
\begin{center}
{\large\sffamily
\suptitle\\}
{\LARGE\bfseries
\maintitle\\}
\subtitle
\end{center}}

% Points
\def\scorename{分}
\newcommand{\score}[1]{%
(#1~\scorename)}

% Header
\RequirePackage{fancyhdr}
\newcommand{\header}[1]{\fancyhead[LO]{#1}}

% Answer Along
\def\nosol%
{\renewenvironment{exam}{\relax}{\relax}
\def\printsol{\relax}
\renewenvironment{sol}{\begin{framed}\setlength{\parindent}{0pt}}{\end{framed}}}