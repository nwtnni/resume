## Basic Resume Template

I wanted to write my own resume template in LaTeX, so here it is, along with some explanatory comments.
My primary reference was [Minutes in Less Than Hours by Jim Hefferon](https://tug.org/pracjourn/2005-4/hefferon/hefferon.pdf).

### Usage

A sample .tex file for use with this template is shown here:

```latex
\documentclass{resume}
\setauthor{First Last}
\setphone{999-999-9999}
\setemail{email@gmail.com}
\setsite{site.com}

\begin{document}

\begin{education}
    \entry{Foo University}{College of Bar}{Expected May 2000}
    \begin{description}
        \item Text here
        \item More text here
    \end{description}
\end{education}

\end{document}
```

The document starts with some initial information (name, phone, email, website),
and then is grouped by category. Each category contains some entries, which are
in turn associated with some description bullet points. This seemed like the most
common way of organizing a resume.

### Annotated Source Code

First, we need to declare dependencies:

```latex
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
\RequirePackage{color}
\RequirePackage{ifthen}
\RequirePackage{hyperref}
```

Then initalize a few options. There are some opportunities for
customization here, including the accent color (in RGB format)
and font.

```latex
% Package options
\Addlcwords{and}
\definecolor{accent}{RGB}{15, 160, 206}

% Margins
\RequirePackage[left=1in, right=1in, top=1.25in, bottom=0in, headheight=50pt, headsep=5pt]{geometry}

% Minimum requirements for .cls file
\renewcommand{\normalsize}{\fontsize{11pt}{11pt}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\pagenumbering{gobble}

% Font loading
\setmainfont{Raleway}
```

Set up some variables and give the user a way to access them:

```latex
% Define variables
\def \@author{Jimbo Smith}
\def \@phone{000-000-0000}
\def \@email{abcdef@gmail.com}
\def \@site{test.com}

\newcommand{\setauthor}[1]{\def \@author{#1}}
\newcommand{\setphone}[1]{\def \@phone{#1}}
\newcommand{\setemail}[1]{\def \@email{#1}}
\newcommand{\setsite}[1]{\def \@site{#1}}
```

And finally set up all of the environments and custom commands
that generate the actual document.

```latex
% Make header
\fancypagestyle{default}{
    \fancyhf{}
    \chead{
        \begin{spacing}{0.75}
            \huge{\@author} 
        \end{spacing}
        \href{mailto:\@email}{\@email}
    }
    \lhead{\@phone}
    \rhead{\href{https://\@site}{\@site}}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\headrule}{\hbox to\headwidth{\color{accent}\leaders\hrule width \headrulewidth\hfill}}
    \renewcommand{\footrulewidth}{0pt}
}
\AtBeginDocument{\thispagestyle{default}}

% Utility macros
\def \@rule{\color{accent}\hrule}
\def \@break{\vspace{.6\baselineskip}}

% Entry with title, date, and description
% Usage: \entry{title}{description}{date}
\newcommand{\entry}[3]{
    \begin{spacing}{0}
        \ifthenelse{\equal{#2}{}}{
            \textbf{#1} \hfill
        }{
            \textbf{#1} - #2 \hfill #3
        }
    \end{spacing}
}

% Itemized descriptions
\renewenvironment{description}{
    \begin{itemize}[label={-}, itemsep=0.1ex, topsep=0.2ex]
    \small
}{
    \end{itemize}
    \@break
}

% Automate setting up similar environments
\newcommand{\@makeenvironment}[1] {
    \newenvironment{#1}{
        \centering
        \textbf{\large{\titlecap{#1}}}
        \@break
    }{
        \@rule
        \@break
    }
}

% Same environment, no line break
\newcommand{\@maketightenvironment}[1] {
    \newenvironment{#1}{
        \centering
        \textbf{\large{\titlecap{#1}}}
        \@break
    }{}
}

% Set up different environments
\@makeenvironment{education}
\@makeenvironment{research experience}
\@makeenvironment{projects}
\@makeenvironment{leadership experience}
\@maketightenvironment{skills}
```
