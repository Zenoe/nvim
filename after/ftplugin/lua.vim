
set foldlevelstart=1
set foldnestmax=2

set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set foldmethod=indent
