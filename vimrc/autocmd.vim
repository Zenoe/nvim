augroup vimrcEx "{{{1
  au!
  " Automatically load .vimrc changes
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

let g:LargeFile = 70000
function! LargeFile()
  set ft=
endfunction
augroup LargeFiles "{{{1
  au!

  autocmd BufRead * let f = getfsize(expand('<afile>')) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
