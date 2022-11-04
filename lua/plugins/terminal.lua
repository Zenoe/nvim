
-- need restart nvim to take effect
require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]],
  -- hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  -- shade_terminals = true,
  -- shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  -- start_in_insert = true,
  -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- persist_size = true,
  -- direction = "horizontal",
  -- close_on_exit = true, -- close the terminal window when the process exits
  -- shell = "/bin/zsh", -- change the default shell
  -- -- This field is only relevant if direction is set to 'float'
  -- float_opts = {
  --   -- The border key is *almost* the same as 'nvim_win_open'
  --   -- see :h nvim_win_open for details on borders however
  --   -- the 'curved' border is a custom border type
  --   -- not natively supported but implemented in this plugin.
  --   border = "single",
  --   height = 100,
  --   winblend = 3,
  -- }
}
-- vim.api.nvim_set_keymap("", "<F8>", '<cmd>execute  v:count . "ToggleTerm dir=\'%:p:h\'"<CR>', {})
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

  -- local term = require("toggleterm.terminal").Terminal
  -- if term:is_open() then
  --   term:send(string.format('cd %s', vim.fn.getcwd()), true)
  -- end
end

local M = {}
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- toggle with directory of current buffer
function M.nnn_toggle()
  local term = require("toggleterm.terminal").Terminal
  local nnn = term:new {
    dir = vim.fn.expand('%:p:h'),
    -- cmd = "nnn -goQ",
    -- direction = "float",
  }
  nnn:toggle()
end

-- require"myscript" has to match the filename of this script, so lua/myscript.lua
vim.api.nvim_set_keymap('n', '<leader>te', ':lua require"plugins.terminal".nnn_toggle()<CR>', {noremap = true})

-- vim.api.nvim_create_autocmd(
--   {'DirChanged'}, {
--     pattern = {'window', 'global'},
--     callback = function()
--       local term = require("toggleterm.terminal").Terminal
--       if term:is_open() then
--         term:send(string.format('cd %s', vim.fn.getcwd()), true)
--       end
--     end
--   }
-- )

return M
