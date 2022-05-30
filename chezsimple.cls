\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chezsimple}

\LoadClass{scrartcl}

\newif\ifchez@date        \chez@datetrue
\newif\ifchez@sf          \chez@sftrue
\newif\ifchez@header      \chez@headerfalse
\newif\ifchez@gray        \chez@grayfalse
\newif\ifchez@box         \chez@boxtrue
\newif\ifchez@algos       \chez@algosfalse
\newif\ifchez@asy         \chez@asyfalse
\newif\ifchez@code        \chez@codefalse
\newif\ifchez@compact     \chez@compactfalse
\newif\ifchez@marginnum   \chez@marginnumtrue
\newif\ifchez@sepcounters \chez@sepcountersfalse

\DeclareOption{nodate}{\chez@datefalse}
\DeclareOption{serifs}{\chez@sffalse}
\DeclareOption{header}{\chez@headertrue}
\DeclareOption{gray}{\chez@graytrue}
\DeclareOption{nobox}{\chez@boxfalse}
\DeclareOption{asy}{\chez@asytrue}
\DeclareOption{algos}{\chez@algostrue}
\DeclareOption{code}{\chez@codetrue\chez@algostrue}
\DeclareOption{compact}{\chez@compacttrue}
\DeclareOption{nomarginnum}{\chez@marginnumfalse}
\DeclareOption{sepcounters}{\chez@sepcounterstrue}

\ProcessOptions*

\KOMAoptions{
  paper=letter,
  fontsize=10pt,
  usegeometry,
  numbers=noendperiod,
}

% General
\RequirePackage{xparse}
\RequirePackage{etoolbox}

\RequirePackage{mathtools, amssymb, amsthm}
\RequirePackage{nccmath}
%\RequirePackage{chezint} % More integrals (e.g. \oiint)

\ifchez@gray\PassOptionsToPackage{gray}{xcolor}\fi
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs} % Better table commands
\RequirePackage{array}

% Typography
\RequirePackage[T1]{fontenc}
\RequirePackage[frak=boondox, frakscaled=0.98, scr=boondoxo]{mathalfa}

\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[scaled=0.83]{beramono}
\SetMathAlphabet\mathtt{normal}{T1}{\ttdefault}{m}{n}
\SetMathAlphabet\mathtt{bold}{T1}{\ttdefault}{b}{n}

\RequirePackage{microtype}
\RequirePackage[nodisplayskipstretch, onehalfspacing]{setspace}

\g@addto@macro\bfseries{\boldmath}

% Page Margins
\RequirePackage{geometry}
\geometry{margin=1.5cm, includefoot}
\ifchez@header\geometry{includehead}\fi

% Headers
\ifchez@header\RequirePackage{scrlayer-scrpage}\fi

% Compact Option
\ifchez@compact\RequirePackage[extreme]{savetrees}\fi

% Diagrams
\RequirePackage{tikz}
\usetikzlibrary{calc, cd, math, matrix, positioning}
\ifchez@asy\RequirePackage[inline]{asymptote}\fi

% Macros
\RequirePackage[shortlabels, inline]{enumitem}

% Theorem Boxes
\ifchez@box\RequirePackage{tcolorbox}\fi

% References
\PassOptionsToPackage{pdftex, pdfcreator={LaTeX with chez.sty by Jason Chen}}{hyperref}
\ifchez@gray
  \RequirePackage{hyperref}
\else
  \RequirePackage[colorlinks]{hyperref} % load this last generally
  \definecolor{urlcolor}{rgb}{0.9, 0, 0.5}
  \definecolor{linkcolor}{rgb}{0, 0.2, 0.8}
  \definecolor{citecolor}{rgb}{0, 0.6, 0.3}
  \hypersetup{urlcolor=urlcolor, linkcolor=linkcolor, citecolor=citecolor}
\fi

% Algorithms/Code
\ifchez@algos\RequirePackage[noend]{algpseudocode}\fi % after hyperref because of counter issue
\ifchez@code\RequirePackage{minted}\fi

% cleveref must be loaded after hyperref
% also is really picky and wants to be loaded after everything
\RequirePackage[nameinlink]{cleveref}

% make math output copy-pasteable
\pdfgentounicode=1
\input{glyphtounicode}
\input{chezglyphtounicode}

% colors
\definecolor{chezred}{rgb}{0.8, 0.05, 0.05}
\definecolor{chezgreen}{rgb}{0.1, 0.4, 0.1}
\definecolor{chezblue}{rgb}{0, 0.3, 0.8}
\definecolor{chezorange}{rgb}{0.86, 0.4, 0}
\definecolor{chezpurple}{rgb}{0.4, 0, 0.7}

\definecolor{chezlightred}{rgb}{1.0, 0.5, 0.05}
\definecolor{chezlightgreen}{rgb}{0.6, 1.0, 0.6}
\definecolor{chezlightblue}{rgb}{0.6, 0.7, 1}
% \definecolor{chezlightorange}{rgb}{0.86, 0.4, 0}
% \definecolor{chezlightpurple}{rgb}{0.4, 0, 0.7}

% I use this enough to need this
\definecolor{todocolor}{rgb}{0.8, 0.1, 0.1}
\NewDocumentCommand{\TODO}{o}{\textcolor{todocolor}{TODO\IfNoValueF{#1}{: #1}}}

% Emphasizing
\definecolor{emphcolor}{rgb}{0, 0.4, 1}
\NewDocumentCommand{\vocab}{m}{\textbf{\textcolor{emphcolor}{#1}}}
\NewDocumentCommand{\answer}{m}{\textcolor{emphcolor}{#1}}
\NewDocumentCommand{\ol}{}{\overline}
\NewDocumentCommand{\ul}{}{\underline}

% Syntactically-named delimiters
\DeclarePairedDelimiter{\braces}{\lbrace}{\rbrace}
\DeclarePairedDelimiter{\parens}{\lparen}{\rparen}
\DeclarePairedDelimiter{\brackets}{\lbrack}{\rbrack}
\DeclarePairedDelimiter{\bbrackets}{\llbracket}{\rrbracket}
\DeclarePairedDelimiter{\angles}{\langle}{\rangle}
\DeclarePairedDelimiter{\verts}{\lvert}{\rvert}
\DeclarePairedDelimiter{\Verts}{\lVert}{\rVert}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

% Semantically-named delimiters
\NewDocumentCommand{\abs}{}{\verts}
\NewDocumentCommand{\size}{}{\verts}
\NewDocumentCommand{\norm}{}{\Verts}
\NewDocumentCommand{\tuple}{}{\angles}
\NewDocumentCommand{\gen}{}{\angles}
\NewDocumentCommand{\fgen}{}{\braces} %free
\DeclarePairedDelimiterX{\set}[1]{\lbrace}{\rbrace}{
  \RenewDocumentCommand{\mid}{}{\;\delimsize\vert\;}%
  #1%
}

% Symbols
\NewDocumentCommand{\eps}{}{\varepsilon}
\NewDocumentCommand{\nullset}{}{\varnothing}
\NewDocumentCommand{\bigand}{}{\bigwedge}
\NewDocumentCommand{\bigor}{}{\bigvee}

% Common Math
\NewDocumentCommand{\half}{}{\frac{1}{2}}
\NewDocumentCommand{\cbrt}{m}{\sqrt[3]{#1}}

% Sets
\NewDocumentCommand{\FF}{}{\mathbb{F}}
\NewDocumentCommand{\NN}{}{\mathbb{N}}
\NewDocumentCommand{\ZZ}{}{\mathbb{Z}}
\NewDocumentCommand{\QQ}{}{\mathbb{Q}}
\NewDocumentCommand{\RR}{}{\mathbb{R}}
\NewDocumentCommand{\CC}{}{\mathbb{C}}
\NewDocumentCommand{\HH}{}{\mathbb{H}}

\newcommand{\intersect}{\DOTSB\cap} % can't use xparse because it protects \DOTSB
\NewDocumentCommand{\bigintersect}{}{\bigcap}
\newcommand{\union}{\DOTSB\cup} % can't use xparse because it protects \DOTSB
\NewDocumentCommand{\bigunion}{}{\bigcup}

% General
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\argmin}{argmin}
\RenewDocumentCommand{\Re}{}{\operatorname{Re}}
\RenewDocumentCommand{\Im}{}{\operatorname{Im}}
\DeclareMathOperator{\cis}{cis}
\DeclareMathOperator{\arccosh}{arccosh}
\DeclareMathOperator{\arcsinh}{arcsinh}
\DeclareMathOperator{\arctanh}{arctanh}
\DeclareMathOperator{\sign}{sign}

% Combinatorics / Statistics
\NewDocumentCommand{\EExp}{}{\operatorname*{\mathbb{E}}}
\NewDocumentCommand{\PProb}{}{\operatorname*{\mathbb{P}}}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\Cov}{Cov}

% Number Theory
\RenewDocumentCommand{\mod}{m}{\ \mathrm{mod}\ #1}
\DeclareMathOperator*{\lcm}{lcm}

% Calculus
\NewDocumentCommand{\dv}{s m m}{
  \IfBooleanTF{#1}
    {d#2/d#3}
    {\frac{d #2}{d #3}}
}
\NewDocumentCommand{\dnv}{s m m m}{
  \IfBooleanTF{#1}
    {d^{#4}#2/d{#3}^{#4}}
    {\frac{d^{#4} #2}{d {#3}^{#4}}}
}
\NewDocumentCommand{\ddv}{s m m}{
  \IfBooleanTF{#1}
    {\dnv*{#2}{#3}{2}}
    {\dnv{#2}{#3}{2}}
}
\NewDocumentCommand{\pdv}{s m m}{
  \IfBooleanTF{#1}
    {\partial{#2}/\partial{#3}}
    {\frac{\partial{#2}}{\partial{#3}}}
}
\NewDocumentCommand{\pdnv}{s m m m}{
  \IfBooleanTF{#1}
    {\partial^{#4}#2/\partial{#3}^{#4}}
    {\frac{\partial^{#4} #2}{\partial{#3}^{#4}}}
}
\NewDocumentCommand{\pddv}{s m m}{
  \IfBooleanTF{#1}
    {\pdnv*{#2}{#3}{2}}
    {\pdnv{#2}{#3}{2}}
}

\let\obelus\div%
\let\div\relax % was originally the division symbol
\DeclareMathOperator{\grad}{grad}
\DeclareMathOperator{\div}{div}
\DeclareMathOperator{\curl}{curl}

% Algebra
\DeclareMathOperator{\ord}{ord}
\newcommand{\iso}{\DOTSB\cong} % can't use xparse because it protects \DOTSB
\NewDocumentCommand{\inv}{}{^{-1}}

\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\Char}{char} % characteristic of a ring; \char already exists
\DeclareMathOperator{\img}{im} % \im is already defined for imaginary part
\DeclareMathOperator{\Ker}{Ker}
\DeclareMathOperator{\Img}{Im}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Tor}{Tor}
\DeclareMathOperator{\Ext}{Ext}

\NewDocumentCommand{\RP}{}{\mathbb{RP}}
\NewDocumentCommand{\CP}{}{\mathbb{CP}}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\SO}{SO}
\DeclareMathOperator{\SU}{SU}
\DeclareMathOperator{\Orth}{O}

\DeclareMathOperator{\Gal}{Gal}

% Algebraic Geometry
\NewDocumentCommand{\PP}{}{\mathbb{P}}
\NewDocumentCommand{\VV}{}{\mathcal{V}}
\NewDocumentCommand{\II}{}{\mathcal{I}}
\DeclareMathOperator{\Spec}{Spec}

% Category Theory
\DeclareMathOperator{\Obj}{Obj}
\DeclareMathOperator{\Hom}{Hom}
\NewDocumentCommand{\cat}{}{\mathsf}

% SETUP
\author{Jason Chen}

\ifchez@date\else\date{~\vspace{-3em}}\fi

% Stylize things
\patchcmd{\@maketitle}{\huge}{\large}{}{}
\setkomafont{author}{\normalsize\scshape}
\setkomafont{date}{\normalsize}
\ifchez@sf\else\setkomafont{disposition}{\normalcolor\bfseries}\fi
\ifchez@header\setkomafont{pageheadfoot}{\normalcolor}\fi
\RedeclareSectionCommand[beforeskip=0.4\baselineskip]{paragraph}

% Section numbers in the margin
\ifchez@marginnum
  \RenewDocumentCommand{\sectionlinesformat}{m m m m}{\makebox[0pt][r]{#3}#4}
\fi

% Compact title
\ifchez@compact
  \patchcmd{\@maketitle}{\@author}{\scshape\@author}{}{}
  \patchcmd{\@maketitle}{\large}{\large\sffamily}{}{}
\fi

\allowdisplaybreaks
\AtBeginDocument{
  \setlength{\belowdisplayskip}{0.5em}
  \setlength{\belowdisplayshortskip}{0.2em}
  \setlength{\abovedisplayskip}{0.5em}
  \setlength{\abovedisplayshortskip}{0.2em}
}

\RenewDocumentCommand{\arraystretch}{}{0.8}
\setlist{nosep, listparindent=\parindent}

% Better default bracket width/height
\let\oldunderbracket\underbracket
\RenewDocumentCommand{\underbracket}{O{0.12ex} O{0.5ex} m}{\oldunderbracket[#1][#2]{#3}}

% Theorem boxes (Heavily copied from Daniel Zhu)
\ifchez@box
  \tcbuselibrary{skins, theorems, xparse, breakable}
  \tcbset{
    chezbox/.style={
      enhanced jigsaw,
      breakable,
      fonttitle=\ifchez@sf\sffamily\fi\bfseries,
      sharp corners,
      boxrule=0pt,
      leftrule=2pt,
      left=5pt,
      coltitle=black,
      attach title to upper=\par,
      lines before break=4,
    },
    chezbluebox/.style={
      chezbox,
      coltitle=blue!80!black,
      colframe=blue!80,
      colback=blue!7,
    },
    chezgreenbox/.style={
      chezbox,
      coltitle=green!40!black,
      colframe=green!70!black,
      colback=green!6,
    },
    chezorangebox/.style={
      chezbox,
      coltitle=orange!80!black,
      colframe=orange!98!black,
      colback=orange!8,
    },
    chezredbox/.style={
      chezbox,
      coltitle=red!60!black,
      colframe=red!80!black,
      colback=red!6,
    },
    chezbluethm/.style={chezbluebox, chezthm},
    chezgreenthm/.style={chezgreenbox, chezthm},
    chezorangethm/.style={chezorangebox, chezthm},
    chezredthm/.style={chezredbox, chezthm},
    chezthm/.style={
      theorem style=break,
      separator sign none,
      description delimiters parenthesis,
      description font=\normalfont\ifchez@sf\sffamily\fi\small,
      terminator sign none,
    },
  }

  \ifchez@marginnum
    \newcommand*{\chez@drawmarginnumber}[1]{
      \node[anchor=north east,
        inner sep=0pt,
        xshift=-0.8em,
        yshift=-1.865ex,
        font=\ifchez@sf\sffamily\fi\bfseries\color{tcbcoltitle}\mathstrut\small]
        at (frame.north west) {#1};
    }
    \tcbset{
      chezthmmargin/.style={
        enhanced jigsaw,
        theorem name,
        extras unbroken and first={
          overlay={
            \ifdef{\thetcbthmcounter}{
              \chez@drawmarginnumber{\thetcbthmcounter}
            }{
              \ifdef{\thetcbcounter}{\chez@drawmarginnumber{\thetcbcounter}}
            }
          },
        },
      },
      chezthm/.append style=chezthmmargin,
    }
  \fi

  % Better theorem declaration syntax
  % (from DZhu, modified for expl3 by Jason Chen)
  \ExplSyntaxOn
  % #1: extra options
  % #2: name
  % #3: display name
  % #4: box style
  % #5: ref prefix
  % #6: ref display
  % #7: ref display plural
  \RenewDocumentCommand \new@tcbtheorem { O{} m m +m m m m }
    { % \@@newtcolorbox is either \NewTColorBox or \RenewTColorBox
      \@@newtcolorbox[auto~counter,crefname={#6}{#7},#1]{#2}{ O{} D<>{} }
        {
          #4,
          title      = {\__tcobox_theo_title:nnn{#3}{\thetcbcounter}{##1}},
          list~entry = {\protect\numberline{\thetcbcounter}##1},
          nameref    = {##1},
          theo@label = {#5}{##2},
        }
      \@@newtcolorbox[#1,no~counter,list~inside=]{#2*}{ O{} }
        {
          #4,
          title = {\__tcobox_theo_title:nnn{#3}{}{##1}},%
        }
    }


  \RenewDocumentCommand \newtcbtheorem {}
    {
      \cs_set_eq:NN \@@newtcolorbox \NewTColorBox
      \new@tcbtheorem
    }


  \RenewDocumentCommand \renewtcbtheorem {}
    {
      \cs_set_eq:NN \@@newtcolorbox \RenewTColorBox
      \new@tcbtheorem
    }

  \ExplSyntaxOff

  %%%%%
  
  % #1: environment name
  % #2: environment display name
  % #3: counter to use
  % #4: box style
  % #5: ref prefix
  % #6: ref display
  % #7: ref display plural
  \newcommand*\zbs@newtheorem[7]{
    \newtcbtheorem[use counter*=#3]{#1}{#2}{#4}{#5}{#6}{#7}
  }
  
  \newcommand*\zbs@numberwithin[2]{
    \ifx#2\zbs@empty\else\numberwithin{#1}{#2}\fi
  }
  \newcounter{thmcounter} \zbs@numberwithin{thmcounter}{\zbs@thm@numberwithin}
  \newcommand\zbs@thmctrmain{thmcounter}
  \ifchez@sepcounters
    \newcounter{probcounter} \zbs@numberwithin{probcounter}{\zbs@thm@numberwithinalt}
    \newcommand\zbs@thmctralt{probcounter}
  \else
    \newcommand\zbs@thmctralt{thmcounter}
  \fi
  
  % #1: star - true if alternate numbers
  % #2: environment name
  % #3: environment display name
  % #4: box style
  % #5: ref prefix
  % #6: ref display
  % #7: ref display plural
  \NewDocumentCommand\zbsnewtheorem{s m m m m m m}{
    \zbs@newtheorem{#2}{#3}{\IfBooleanTF{#1}{\zbs@thmctralt}{\zbs@thmctrmain}}{#4}{#5}{#6}{#7}
  }

  \ExplSyntaxOn
  % NOTE: math in adhoctheorem titles must be in $...$, not \(...\)
  \NewTColorBox{adhoctheorem}{O{} m !D(){\zbs@thmctralt} !O{} !D<>{}}{
    chezorangethm,
    code={\letcs\thetcbthmcounter{the#3}},
    theorem={{#2}}{#3}{#4}{#5},#1
  }
  \NewTColorBox{adhoctheorem*}{O{} m O{}}{
    chezorangethm,
    title={\__tcobox_theo_title:nnn{#2}{\@empty}{#3}},#1
  }
  \ExplSyntaxOff

  \zbsnewtheorem{theorem}{Theorem}{chezbluethm}{thm}{theorem}{theorems}
  \zbsnewtheorem{lemma}{Lemma}{chezbluethm}{lem}{lemma}{lemmas}
  \zbsnewtheorem{claim}{Claim}{chezbluethm}{claim}{claim}{claims}
  \zbsnewtheorem{proposition}{Proposition}{chezbluethm}{prop}{proposition}{propositions}
  \zbsnewtheorem{corollary}{Corollary}{chezbluethm}{cor}{corollary}{corollaries}
  \zbsnewtheorem{conjecture}{Conjecture}{chezbluethm}{conj}{conjecture}{conjectures}
  \zbsnewtheorem{algorithm}{Algorithm}{chezbluethm}{alg}{algorithm}{algorithms}

  \zbsnewtheorem{definition}{Definition}{chezredthm}{def}{definition}{definitions}

  \zbsnewtheorem{example}{Example}{chezgreenthm}{ex}{example}{examples}

  \zbsnewtheorem{fact}{Fact}{chezorangethm}{fact}{fact}{facts}
  \zbsnewtheorem{note}{Note}{chezorangethm}{note}{note}{notes}

  \zbsnewtheorem*{problem}{Problem}{chezorangethm}{problem}{problem}{problems}
  \zbsnewtheorem*{question}{Question}{chezorangethm}{question}{question}{questions}
  \zbsnewtheorem*{exercise}{Exercise}{chezorangethm}{ex}{exercise}{exercises}
  \zbsnewtheorem*{remark}{Remark}{chezorangethm}{remark}{remark}{remarks}

  % TODO: footnotes
  % TODO: non-box case
\else
  \RequirePackage{thmtools}
  \declaretheoremstyle[bodyfont=\normalfont]{default}

  \declaretheorem[name=Theorem, style=default]{theorem}
  \declaretheorem[name=Definition, style=default]{definition}
  \declaretheorem[name=Lemma, style=default]{lemma}
  \declaretheorem[name=Claim, style=default]{claim}
  \declaretheorem[name=Corollary, style=default]{corollary}
  \declaretheorem[name=Fact, style=default]{fact}
  \declaretheorem[name=Generalization, style=default]{generalization}
  \declaretheorem[name=Example, style=default]{example}

  \declaretheorem[name=Theorem, numbered=no, style=default]{theorem*}
  \declaretheorem[name=Definition, numbered=no, style=default]{definition*}
  \declaretheorem[name=Lemma, numbered=no, style=default]{lemma*}
  \declaretheorem[name=Claim, numbered=no, style=default]{claim*}
  \declaretheorem[name=Corollary, numbered=no, style=default]{corollary*}
  \declaretheorem[name=Fact, numbered=no, style=default]{fact*}
  \declaretheorem[name=Generalization, numbered=no, style=default]{generalization*}
  \declaretheorem[name=Example, numbered=no, style=default]{example*}
\fi

% Redefine to reduce surrounding spacing
\RenewDocumentEnvironment{proof}{o}{\pushQED{\qed}\par\noindent\textit{Proof\IfNoValueF{#1}{ (#1)}}.}{\popQED\par\medskip}
\NewDocumentEnvironment{proof*}{m}{\pushQED{\qed}\par\noindent\textit{#1}.}{\popQED\par\medskip}

% Algorithms
\ifchez@algos
  \NewDocumentCommand{\ElseIf}{}{\ElsIf}

  % Fix https://tex.stackexchange.com/questions/177025/ issue with
  % hyperref, cleveref, and algpseudocode
  \newcounter{algorithmicH} % New algorithmic-like hyperref counter
  \let\oldalgorithmic\algorithmic
  \RenewDocumentCommand{\algorithmic}{}{%
    \stepcounter{algorithmicH}%
    \oldalgorithmic}%
  \RenewDocumentCommand{\theHALG@line}{}{ALG@line.\thealgorithmicH.\arabic{ALG@line}}
\fi

\ifchez@code\setminted{linenos=true, breaklines=true, tabsize=4, python3=true, baselinestretch=1}\fi
