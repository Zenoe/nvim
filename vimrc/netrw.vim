let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 18
" augroup ProjectDrawer
"   autocmd!
"   " autocmd VimEnter * :Vexplore
"   " autocmd FileType netrw nnoremap q :bd<CR>
" augroup END

nnoremap <leader>le :Lexplore<CR>
nnoremap <leader>se :Sexplore<CR>
