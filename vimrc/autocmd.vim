augroup autosource
  au!
  autocmd bufwritepost *.vim source %
augroup END

" augroup vimrcEx "{{{1
"   au!
"   " Automatically load .vimrc changes
"   autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
" augroup END

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

augroup helpWin
  au!
  autocmd FileType help noremap <buffer> q :q<cr>
augroup END

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup telescope
  au!
  autocmd FileType TelescopePrompt let b:autopairs_enabled = 0
augroup END

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
augroup end

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd FileType netrw nmap <silent> <buffer> <Esc> :bd<cr>
