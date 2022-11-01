call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
" 'file_command' : for ripgrep : ['rg', '--files']
"                : for fd      : ['fd', '-tf']
" 'dir_command'  : for fd      : ['fd', '-td']
" 'filters'      : use ['cpsm_filter'] for performance, requires cpsm vim plugin
"                  found at https://github.com/nixprime/cpsm

" call wilder#set_option('pipeline', [
"       \   wilder#branch(
"       \     wilder#cmdline_pipeline(),
"       \     [
"       \       {_, x -> x[:1] ==# '\v' ? x[2:] : x},
"       \     ] + wilder#search_pipeline(),
"       \   ),
"       \ ])
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['rg', '--files'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 2,
      \       'set_pcre2_pattern': 1,
      \       'filters': ['fuzzy_filter'],
      \     }),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])


call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': wilder#lua_fzy_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': wilder#lua_fzy_highlighter(),
      \ }),
      \ }))
