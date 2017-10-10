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
\RequirePackage[left=1in, right=1in, top=1in, bottom=1in]{geometry}

% Define variables
\def \@author{Jimbo Smith}
\newcommand{\setauthor}[1]{\def \@author{#1}}
\newcommand{\show@author}{\@author}

\def \@phone{000-000-0000}
\newcommand{\setphone}[1]{\def \@phone{#1}}
\newcommand{\show@phone}{\@phone}

\def \@email{abcdef@gmail.com}
\newcommand{\setemail}[1]{\def \@email{#1}}
\newcommand{\show@email}{\@email}

\def \@address{32 Test Avenue, New York, New York, 15920}
\newcommand{\setaddress}[1]{\def \@address{#1}}
\newcommand{\show@address}{\@address}

% Make header
\RequirePackage{fancyhdr}
\fancypagestyle{default}{
    \fancyhf{}
    \chead{\show@author}
    \renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{default}}

