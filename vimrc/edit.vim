set nofoldenable
nnoremap <leader>m :let @*=trim(execute('messages')) \| echo 'copied' <cr>
" :noremap kj :echo "Hrr, j!"<cr>
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap ,s :split <C-R>=expand("%:p:h") . "/" <CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <CR> :noh<CR><CR>
" relative path
" :let @+ = expand("%")
" full path
vnoremap P "0p
nnoremap <leader>yp :let @+ = expand("%:p")<cr>
" just filename
nnoremap <leader>yf :let @+ = expand("%:t")<cr>
" nnoremap <expr> g<c-v> '`[' . getregtype()[0] . '`]'
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
" nnoremap <Leader>cd :call fzf#run({'source': 'fd -t d -H . ~', 'sink': 'cd'})<CR>
cnoremap <C-y> <C-r>+
" clear the last search pattern
" :let @/ = ""

" inoremap { {<CR>}<Esc>ko
" inoremap { {<CR>}<Up><Enter>
" inoremap { {}<Left>
" inoremap ( ()<Left>
" inoremap < <><Left>
" inoremap [ []<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
nnoremap zp o<esc>p==$
nnoremap z; V$%

nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
inoremap <silent> <C-S> <c-o>:w<cr>
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
" not worked
"let g:AutoPairsFiletypeBlacklist = ['TelescopePrompt']

" jump to the previous function
nnoremap <silent> [c :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]c :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>
