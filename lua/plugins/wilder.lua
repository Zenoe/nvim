-- https://github.com/gelguy/wilder.nvim
local wilder = require("wilder")
wilder.setup({
  modes = {':', '/', '?'}
})

-- Disable Python remote plugin
wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = wilder.lua_fzy_filter(),
    }),
    wilder.vim_search_pipeline()

    -- wilder.python_file_finder_pipeline({
    --   -- to use ripgrep : {'rg', '--files'}
    --   -- to use fd      : {'fd', '-tf'}
    --   file_command = {'rg', '--files'},
    --   -- file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'},
    --   -- to use fd      : {'fd', '-td'}
    --
    --   dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
    --   -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
    --   -- found at https://github.com/nixprime/cpsm
    --   filters = {'fuzzy_filter', 'difflib_sorter'}
    -- })
  )
})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    -- wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
    highlighter = wilder.lua_fzy_highlighter(),
    highlights = {
    accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
  },
    -- left = {
    --   ' ',
    --   wilder.popupmenu_devicons()
    -- },
    -- right = {
    --   ' ',
    --   wilder.popupmenu_scrollbar()
    -- },
  }),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = wilder.lua_fzy_highlighter(),
  }),
}))
