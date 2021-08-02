\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chezarticle}

\LoadClass{scrartcl}

\DeclareOption{header}{%
  \PassOptionsToClass{headinclude}{scrartcl}%
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

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

\RequirePackage{chez}
