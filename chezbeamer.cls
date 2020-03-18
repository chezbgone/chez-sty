\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chezbeamer}

\LoadClass{beamer}

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{beamer}}
\ProcessOptions\relax

\RequirePackage{chezbase}
