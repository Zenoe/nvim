require("sessions").setup({

  -- autocmd events which trigger a session save
  --
  -- the default is to only save session files before exiting nvim.
  -- you may wish to also save more frequently by adding "BufEnter" or any
  -- other autocmd event
  -- events = { "WinEnter" },
  events = { "VimLeavePre" },
  session_filepath = ".nvim/session",
})

vim.cmd [[
nnoremap <leader>ss :SessionsSave<Space>
nnoremap <leader>sl :SessionsLoad<Space>
]]

-- map("n", "<Leader>ss", "<cmd>echo 'xx' <cr>")
-- :SessionsSave[!] [path]
-- Save a session file to the given path. If the path exists it will be overwritten. Starts autosaving the session on the configured events.
--
-- :SessionsLoad[!] [path]
-- Load a session file from the given path. If the path does not exist no session will be loaded. Starts autosaving changes to the session after loading.
