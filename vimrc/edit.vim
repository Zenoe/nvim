nnoremap <leader>m :let @*=trim(execute('messages')) \| echo 'copied' <cr>
":noremap kj :echo "Hello, kj!"<cr>
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap ,s :split <C-R>=expand("%:p:h") . "/" <CR>


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

:nnoremap zp o<esc>p==$
" nnoremap <C-t> :ToggleTerm<CR>

" sets a mapping so that pressing F2 in normal mode will invert the 'paste' option, and will then show the value of that option
nnoremap <F2> :set invpaste paste?<CR>
" work in insert mode
set pastetoggle=<F2>
" enables displaying whether 'paste' is turned on in insert mode.
set showmode
" not worked
"let g:AutoPairsFiletypeBlacklist = ['TelescopePrompt']
