
vim.cmd([[
let path = expand("~/.config/nvim/vimrc/")
if has('win32')
    let path = $LOCALAPPDATA . "/nvim/vimrc/"
endif

let config_list = [
\ 'edit.vim',
\ 'autocmd.vim',
\ 'wilder.vim',
\ 'netrw.vim'
\]
for file in config_list
    exec 'source' path . file
endfor
]])
