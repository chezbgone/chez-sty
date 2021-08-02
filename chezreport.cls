\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chezreport}

\LoadClass{scrreprt}

\DeclareOption{header}{%
  \PassOptionsToClass{headinclude}{scrreprt}%
  \PassOptionsToPackage{header}{chez}%
}

\DeclareOption{nodate}{\PassOptionsToPackage{nodate}{chez}}
\DeclareOption{serifs}{\PassOptionsToPackage{serifs}{chez}}
\DeclareOption{gray}{\PassOptionsToPackage{gray}{chez}}
\DeclareOption{nobox}{\PassOptionsToPackage{nobox}{chez}}
\DeclareOption{asy}{\PassOptionsToPackage{asy}{chez}}
\DeclareOption{algos}{\PassOptionsToPackage{algos}{chez}}
\DeclareOption{code}{\PassOptionsToPackage{code}{chez}}
\DeclareOption{compact}{\PassOptionsToPackage{compact}{chez}}
\DeclareOption{nomarginnum}{\PassOptionsToPackage{nomarginnum}{chez}}
\DeclareOption{sepcounters}{\PassOptionsToPackage{sepcounters}{chez}}

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

\RequirePackage{chez}
