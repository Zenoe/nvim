vim.api.nvim_create_user_command(
  'Upper',
  function(opts)
    print(string.upper(opts.args))
  end,
  { nargs = 1 }
)


vim.api.nvim_create_user_command(
  'Tlua',
  function()

    local vfn = vim.api
    local line = vfn.nvim_get_current_line()
    -- local char = string.sub(line, byte_index, byte_index)
    local r,c = unpack(vim.api.nvim_win_get_cursor(0))
    print(r, c, line)
  end,
  { nargs = 1 }
)
