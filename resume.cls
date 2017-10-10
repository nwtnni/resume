% resume.cls
% Basic resume template
% Newton Ni, cn279@cornell.edu 

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2017/10/10]

% Inherit from article
\LoadClass{article}

% Required
\renewcommand{\normalsize}{\fontsize{11pt}{12pt}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\pagenumbering{gobble}

% Font loading
\RequirePackage{fontspec}
\DeclareOption{monospace}{\setmainfont{Inconsolata}}
\DeclareOption{regular}{\setmainfont{Open Sans}}
\ProcessOptions

% Margins
\RequirePackage[left=1in, right=1in, top=1.2in, bottom=1.2in, headheight=80pt, headsep=15pt]{geometry}

% Define variables
\def \@author{Jimbo Smith}
\newcommand{\setauthor}[1]{\def \@author{#1}}

\def \@phone{000-000-0000}
\newcommand{\setphone}[1]{\def \@phone{#1}}

\def \@email{abcdef@gmail.com}
\newcommand{\setemail}[1]{\def \@email{#1}}

\def \@site{test.com}
\newcommand{\setsite}[1]{\def \@site{#1}}

% Make header
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\fancypagestyle{default}{
    \fancyhf{}
    \chead{
        \begin{spacing}{0.75}
            \huge{\@author} 
        \end{spacing}
        \@email
    }
    \lhead{\@phone}
    \rhead{\@site}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{default}}

