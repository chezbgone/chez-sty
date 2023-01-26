\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chezreport}

\LoadClass{scrreport}

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
\DeclareOption{numberwithinsection}{\PassOptionsToPackage{numberwithinsection}{chez}}
\DeclareOption{sepcounters}{\PassOptionsToPackage{sepcounters}{chez}}

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{scrreport}}
\ProcessOptions\relax

\RequirePackage{chez}
