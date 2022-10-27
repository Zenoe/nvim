" set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2
" let javaScript_fold=1         " JavaScript

set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
" set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
" set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
" set fillchars=fold:\\
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
