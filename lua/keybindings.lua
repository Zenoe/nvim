local map = require("utils").map

vim.api.nvim_create_user_command('Rel', 'source $MYVIMRC', {})

-- toggle line break
map("n", "<leader>rl", ":w | :source %<CR>", {})
-- wrap
map("n", "<Leader>lb", ":set wrap! linebreak!<cr>")
map("n", "j", "gj")
map("n", "k", "gk")

-- navigation
--- behave like other capitals
map("n", "Y", "y$")
--- keeping it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
--- moving text
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

-- telescope
map("n", "<Leader> ", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>.", "<cmd>Telescope file_browser path=%:p:h<cr>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<Leader>*", "<cmd>Telescope grep_string<cr>")
map("n", "<Leader>fr", "<cmd>Telescope oldfiles<cr>")
map("n", "<Leader>fp", "<cmd>Telescope projects<cr>")
map("n", "<Leader>f.", "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>")
map("n", "<Leader>/", "<cmd>lua require('telescope.builtin').live_grep( { cwd = vim.fn.expand('%:p:h') })<cr>")
map("n", "<Leader>'", "<cmd>Telescope resume<cr>")

-- hop
map("n", "<Leader>w", "<cmd>HopWord<cr>")
map("n", "<Leader>hc", "<cmd>HopChar2<cr>")
map("n", "<Leader>ha", "<cmd>HopLineAC<cr>")
map("n", "<Leader>hl", "<cmd>HopLine<cr>")

-- buffer
map("n", "<Leader>bb", "<cmd>Telescope buffers<cr>")
map("n", "<Leader>;", "<cmd>:b#<cr>")
map("n", "[b", "<cmd>:bp<cr>")
map("n", "]b", "<cmd>:bn<cr>")
-- bp command (“buffer previous”) moves us to a different buffer in the current window (bn would work, too),
-- then bd # (“buffer delete” “alternate file”) deletes the buffer we just moved away from
map("n", "zx", "<cmd>:bp|bd #<cr>")

--- quicklist
map("n", "<leader>qn", "<cmd>:cnext<cr>")
map("n", "<leader>qp", "<cmd>:cprev<cr>")
map("n", "<leader>qo", "<cmd>:copen<cr>")

-- -- lua tree
-- map("n", "<Leader>tt", "<cmd>NvimTreeToggle<cr>")
-- map("n", "<Leader>tf", "<cmd>:vimTreeFindFileToggle!<cr>")
-- map("n", "<Leader>tr", "<cmd>NvimTreeRefresh<cr>")

-- language server
map("n", "<Leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<Leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<Leader>vsd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
map("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "<Leader>vf", "<cmd>Format<CR>")

-- neogit
map("n", "<Leader>go", "<cmd>Neogit<CR>")
map("n", "<Leader>gc", "<cmd>Neogit commit<CR>")
map("n", "<Leader>gws", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
map("n", "<Leader>gwc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>")

-- tab
vim.cmd[[
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
]]
map('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
-- Select all text in current buffer

-- edit
map("n", "<Leader>st", "<cmd>Switch<CR>")
