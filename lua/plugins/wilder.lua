-- https://github.com/gelguy/wilder.nvim
local wilder = require("wilder")
wilder.setup({
  modes = {':', '/', '?'},
  -- enable_cmdline_enter=0
})

-- Disable Python remote plugin
wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    -- cause error, but not for vim script config
    -- wilder.python_file_finder_pipeline({
    --   -- to use fd      : {'fd', '-tf'}
    --   file_command = {'rg', '--files'},
    --   dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
    --   -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
    --   -- found at https://github.com/nixprime/cpsm
    --   filters = {'fuzzy_filter', 'difflib_sorter'}
    -- }),

    wilder.cmdline_pipeline({
      -- fuzzy = 1, ==>  must match the first character
      -- type 2 fuzzy In Type 2 FS, the decision boundary is uncertain and thus is not sharp
      fuzzy = 2,
      -- fuzzy_filter = wilder.lua_fzy_filter(), -- default
    })
    -- wilder.python_search_pipeline({
    --   pattern = 'fuzzy',
    -- })

    -- for neovim, if uncommented, error occurs when begin to search
    -- wilder.python_search_pipeline({ })

  )
})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = {
      wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
      wilder.lua_fzy_highlighter(),
    },
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
