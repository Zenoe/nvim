nnoremap <leader>m :let @*=trim(execute('messages')) \| echo 'copied' <cr>
":noremap kj :echo "Hello, kj!"<cr>
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
