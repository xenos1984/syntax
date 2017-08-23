" TeX syntax for vim

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=@,*,48-57,a-z,A-Z

syntax case match

syntax sync minlines=100
syntax sync maxlines=500

syntax spell toplevel

" Document: \begin{document} ... \end{document}
syntax region texDocument start="\\begin{document}" end="\\end{document}" contains=TOP,texHead,@texDocClass,@texUsePkg

" Generic Command: \...
syntax match texCommand "\\[a-zA-Z*@]*\>" contains=@texKeyword,@NoSpell
syntax match texCommand "\\[^a-zA-Z]"

" Environments: \begin{...} ... \end{...}
syntax cluster texEnv contains=texEnvDelim,texEnvName,texEnvArgs,texEnvs

syntax match texEnvDelim "\\begin\>\|\\end\>" nextgroup=texEnvName contains=@NoSpell
syntax region texEnvName matchgroup=texEnvDelim start="{" end="}" contained nextgroup=texEnvArgs contains=texEnvs,@NoSpell
syntax region texEnvArgs matchgroup=texEnvDelim start="\[" end="]" contained contains=@NoSpell

syntax keyword texEnvs contained document abstract thebibliography
syntax keyword texEnvs contained equation equation* align align* gather gather* eqnarray eqnarray* subequations split multline multline*
syntax keyword texEnvs contained itemize enumerate
syntax keyword texEnvs contained array cases subequations
syntax keyword texEnvs contained matrix pmatrix bmatrix Bmatrix vmatrix Vmatrix smallmatrix
syntax keyword texEnvs contained frame columns block

" Labels: \label, \ref, \eqref, \bibitem, \cite, \index
syntax region texLabel start='\\\%(label\|ref\|eqref\|bibitem\|cite\|index\){' end='}' contains=@NoSpell

" Sectioning: \part, \chapter, \section, \subsection, \subsubsection, \paragraph, subparagraph
syntax region texSection start='\\\%(part\|chapter\*\?\|section\*\?\|subsection\*\?\|subsubsection\*\?\|paragraph\|subparagraph\|frametitle\){' end='}' contains=texCommand,texSingleDollar,@Spell
syntax keyword texSectionType contained part chapter chapter* section section* subsection subsection* subsubsection subsubsection* paragraph subparagraph frametitle

" Preamble Stuff: \documentclass, \usepackage, ...
syntax cluster texDocClass contains=texDocClassDecl,texDocClassArgs,texDocClassName,texDocClasses

syntax match texDocClassDecl '\\documentclass\>' nextgroup=texDocClassName,texDocClassArgs contains=@NoSpell
syntax region texDocClassArgs matchgroup=texDocClassDecl start="\[" end="]" contained nextgroup=texDocClassName contains=@NoSpell
syntax region texDocClassName matchgroup=texDocClassDecl start="{" end="}" contained contains=texDocClasses,@NoSpell

syntax keyword texDocClasses contained article report book

syntax cluster texUsePkg contains=texUsePkgDecl,texUsePkgArgs,texUsePkgName,texUsePkgs

syntax match texUsePkgDecl '\\usepackage\>' nextgroup=texUsePkgName,texUsePkgArgs contains=@NoSpell
syntax region texUsePkgArgs matchgroup=texUsePkgDecl start="\[" end="]" contained nextgroup=texUsePkgName contains=@NoSpell
syntax region texUsePkgName matchgroup=texUsePkgDecl start="{" end="}" contained contains=texUsePkgs,@NoSpell

" Article Information: \title, \author, ...
syntax region texHead start="\\\%(title\|author\|date\|subtitle\|institute\){" end="}" contains=texCommand,texSingleDollar,@Spell
syntax keyword texHeadType contained title author data subtitle institute

" Math: $...$, $$...$$, \(...\), \[...\], environments
syntax cluster texMath contains=texSingleDollar,texDoubleDollar,texMathInline,texMathDisplayed,texMathEnviron

syntax region texSingleDollar start="\$" end="\$" contains=texComment,texCommand,@NoSpell keepend
syntax region texDoubleDollar start="\$\$" end="\$\$" contains=texComment,texCommand,texEnvDelim,@NoSpell keepend
syntax region texMathInline start="\\(" end="\\)" contains=texComment,texCommand,@NoSpell keepend
syntax region texMathDisplayed start="\\\[" end="\\]" contains=texComment,texCommand,texEnvDelim,@NoSpell keepend

syntax region texMathEnviron start="\\begin{\%(displaymath\|equation\|equation\*\|align\|align\*\|gather\|gather\*\|multline\|multline\*\|eqnarray\|eqnarray\*\)}" end="\\end{\%(displaymath\|equation\|equation\*\|align\|align\*\|gather\|gather\*\|multline\|multline\*\|eqnarray\|eqnarray\*\)}" contains=texComment,texCommand,texEnvDelim,texLabel,@NoSpell keepend

" Comments: % ...
syntax region texComment start='\\\@<!\%(\\\\\)*%' end='$' keepend

" Keywords:
syntax cluster texKeyword contains=texSectionType,texHeadType,texDefine,texStructure,texGreek,texOperator,texRelation,texArrow,texModifier,texFont,texLeftRight,texMiscMath,texSpace,texItem

syntax keyword texDefine contained newcommand renewcommand DeclareMathOperator

syntax keyword texStructure contained maketitle tableofcontents frontmatter mainmatter backmatter appendix acknowledgments

syntax keyword texGreek contained alpha beta gamma digamma delta epsilon varepsilon theta vartheta eta zeta iota kappa varkappa lambda mu nu xi omicron pi varpi rho varrho sigma varsigma tau upsilon phi varphi chi psi omega Gamma Delta Lambda Phi Pi Psi Sigma Theta Upsilon Xi Omega

syntax keyword texOperator contained amalg ast bigcirc bigtriangledown bigtriangleup bullet cap cdot circ cup dagger ddagger diamond div lhd mp odot ominus oplus oslash otimes pm rhd setminus sqcap sqcup star times triangleleft triangleright unlhd unrhd uplus vee wedge wr
syntax keyword texOperator contained nabla partial square triangle forall exists nexists to mapsto sqrt sin cos tan cot exp ln log arccos arcsin arctan arg cosh coth sinh tanh lim
syntax keyword texOperator contained sum prod bigcup bigcap int oint bigodot bigoplus bigotimes biguplus bigsqcup bigvee bigwedge coprod

syntax keyword texRelation contained approx asymp bowtie cong dashv doteq equiv frown Join mid models parallel perp prec preceq propto sim simeq smile succ succeq vdash
syntax keyword texRelation contained sqsubset sqsubseteq sqsupset sqsupseteq subset subseteq supset supseteq in ni notin
syntax keyword texRelation contained gg ll geq leq neq

syntax keyword texArrow contained downarrow Downarrow hookleftarrow hookrightarrow leadsto leftarrow Leftarrow leftrightarrow Leftrightarrow longleftarrow Longleftarrow longleftrightarrow Longleftrightarrow longmapsto longrightarrow Longrightarrow mapsto nearrow nwarrow rightarrow Rightarrow searrow swarrow uparrow Uparrow updownarrow Updownarrow

syntax keyword texModifier contained vec hat bar dot ddot dddot ddddot tilde mathring acute breve check grave

syntax keyword texMiscMath contained frac eth ell Re Im infty imath jmath
syntax keyword texMiscMath contained ldots cdots vdots ddots

syntax keyword texSpace contained quad qquad phantom

syntax keyword texFont contained mathfrak mathcal mathbb mathrm mathsf mathit mathnormal mathds mathbf textbf textit textrm emph text

syntax keyword texItem contained item

" Brackets:
syntax keyword texLeftRight contained left right big bigg biggg Big Bigg Biggg

" Highlighting:
hi def link texCommand Keyword
hi def link texComment Comment
hi def link texEnvDelim Conditional
hi def link texEnvName Conditional
hi def link texEnvArgs Conditional
hi def link texEnvs Repeat
hi def link texDocClassDecl PreProc
hi def link texDocClassArgs PreProc
hi def link texDocClassName PreProc
hi def link texDocClasses Type
hi def link texUsePkgDecl Include
hi def link texUsePkgArgs Include
hi def link texUsePkgName Include
hi def link texLabel Label
hi def link texSection Structure
hi def link texSectionType Structure
hi def link texHead StorageClass
hi def link texHeadType StorageClass
hi def link texSingleDollar Identifier
hi def link texDoubleDollar Identifier
hi def link texMathInline Identifier
hi def link texMathDisplayed Identifier
hi def link texMathEnviron Identifier
hi def link texLeftRight Delimiter
hi def link texDefine Macro
hi def link texStructure TypeDef
hi def link texGreek Constant
hi def link texOperator Operator
hi def link texRelation Operator
hi def link texArrow Operator
hi def link texModifier Special
hi def link texMiscMath Special
hi def link texFont Function
hi def link texSpace Special
hi def link texItem Exception

let b:current_syntax = "tex"

let &cpo = s:cpo_save
unlet s:cpo_save

