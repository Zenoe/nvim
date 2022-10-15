
-- Copy to clipboard.
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
-- Paste from clipboard.
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
-- Delete without changing the registers
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')
-- Select all text in current buffer

vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
:noremap kj :echo "Hello, kj!"<cr>
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
