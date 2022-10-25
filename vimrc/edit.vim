nnoremap <leader>m :let @*=trim(execute('messages')) \| echo 'copied' <cr>
" :noremap kj :echo "Hrr, j!"<cr>
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" relative path
" :let @+ = expand("%")
" full path
nnoremap <leader>yp :let @+ = expand("%:p")<cr>
" just filename
nnoremap <leader>yf :let @+ = expand("%:t")<cr>

" nnoremap <Leader>cd :call fzf#run({'source': 'fd -t d -H . ~', 'sink': 'cd'})<CR>
cnoremap <C-y> <C-r>+

" inoremap { {<CR>}<Esc>ko
" inoremap { {<CR>}<Up><Enter>
" inoremap { {}<Left>
" inoremap ( ()<Left>
" inoremap < <><Left>
" inoremap [ []<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
nnoremap zp o<esc>p==$

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
