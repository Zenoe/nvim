"Esc

" Map key chord `jk` or 'kj' to <Esc>.
" press tow keys almost simultaneously
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')

set nofoldenable
let g:loaded_matchit = 1
nnoremap <leader>mm :let @*=trim(execute('messages')) \| echo 'copied' <cr>
" :noremap kj :echo "Hrr, j!"<cr>
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap ,s :split <C-R>=expand("%:p:h") . "/" <CR>
" highlight current word without moving cursor
nnoremap gn :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <leader>bx :message<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <ESC> :noh<CR><CR>
" relative path
" :let @+ = expand("%")
" copy full path
vnoremap P "0p
nnoremap <leader>yp :let @+ = expand("%:p")<cr>
" copy filename
nnoremap <leader>yf :let @+ = expand("%:t")<cr>
" nnoremap <expr> g<c-v> '`[' . getregtype()[0] . '`]'
" select last pasted block
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
" nnoremap <Leader>cd :call fzf#run({'source': 'fd -t d -H . ~', 'sink': 'cd'})<CR>
cnoremap <C-y> <C-r>+
noremap ;b :b<space>
" clear the last search pattern
" :let @/ = ""
function! IndentPaste()
  execute "normal o\<Esc>p"
  " execute "normal! ". '`[' . getregtype()[0] . '`]' . '='
  " or
  normal gp=
endfunction

nnoremap zp <Cmd>call IndentPaste()<CR>
" inoremap { {<CR>}<Esc>ko
" inoremap { {<CR>}<Up><Enter>
" inoremap { {}<Left>
" inoremap ( ()<Left>
" inoremap < <><Left>
" inoremap [ []<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
nnoremap z; V$%

nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
inoremap <silent> <C-S> <c-o>:w<cr>
inoremap <silent> <C-l> <C-o>u
" :noremap <C-s> :w<CR>
" nnoremap <C-t> :ToggleTerm<CR>

" sets a mapping so that pressing F2 in normal mode will invert the 'paste' option, and will then show the value of that option
" repeat last command
noremap <F3> @:
nnoremap <F2> :set invpaste paste?<CR>
" work in insert mode
set pastetoggle=<F2>
" enables displaying whether 'paste' is turned on in insert mode.
set showmode
set nolist
" not worked
"let g:AutoPairsFiletypeBlacklist = ['TelescopePrompt']

" jump to the previous function
nnoremap <silent> [c :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]c :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
inoremap <M-;> <C-r>+
"" plugin ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" command line mode
cnoremap <M-a> <Home>
cnoremap <M-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" color
"to Show whitespace, MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey
colorscheme tokyonight
" TabLineSel - is the current (so to say) active tab label.
" TabLine - are the labels which are not currently active.
" TabLineFill - is the remaining of the tabline where there is no labels (background).
hi TabLine      guifg=#111 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#00ff00 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
