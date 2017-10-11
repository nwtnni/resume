% resume.cls
% Basic resume template
% Newton Ni, cn279@cornell.edu 

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2017/10/10]

% Inherit from article
\LoadClass{article}

% Prerequisites
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{titlecaps}

% Margins
\RequirePackage[left=1in, right=1in, top=1.2in, bottom=1.2in, headheight=80pt, headsep=15pt]{geometry}

% Required
\renewcommand{\normalsize}{\fontsize{11pt}{12pt}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\pagenumbering{gobble}

% Font loading
\DeclareOption{monospace}{\setmainfont{Inconsolata}}
\DeclareOption{regular}{\setmainfont{Open Sans}}
\ProcessOptions

% Define variables
\def \@author{Jimbo Smith}
\def \@phone{000-000-0000}
\def \@email{abcdef@gmail.com}
\def \@site{test.com}

\newcommand{\setauthor}[1]{\def \@author{#1}}
\newcommand{\setphone}[1]{\def \@phone{#1}}
\newcommand{\setemail}[1]{\def \@email{#1}}
\newcommand{\setsite}[1]{\def \@site{#1}}

% Make header
\fancypagestyle{default}{
    \fancyhf{}
    \chead{
        \begin{spacing}{0.75}
            \huge{\@author} 
        \end{spacing}
        \large{\@email}
    }
    \lhead{\large{\@phone}}
    \rhead{\large{\@site}}
    \renewcommand{\footrulewidth}{0pt}
}
\AtBeginDocument{\thispagestyle{default}}

% Entry with title, date, and description
% Usage: \entry{title}{date}{description}
\newcommand{\entry}[2]{
    \begin{spacing}{0}
        \textbf{\large{{#1}}} \hfill \large{#2}
    \end{spacing}
}

% Itemized descriptions
\renewenvironment{description}{
    \begin{itemize}[label={-}, itemsep=0.1ex, topsep=0.2ex]
    \small
}{
    \end{itemize}
    \vspace{\baselineskip}
}

% Automate setting up similar environments
\newcommand{\@makeenvironment}[1] {
    \newenvironment{#1}{
        \begin{spacing}{1.0}
            \begin{center}
                \textbf{\large{\titlecap{#1}}}
            \end{center}
        \end{spacing}
    }{
        \hrule
    }
}

% Set up different environments
\@makeenvironment{education}
\@makeenvironment{work}
\@makeenvironment{projects}
\@makeenvironment{skills}
