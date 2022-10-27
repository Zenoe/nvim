require "nvim-tree".setup {
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  }
}

require("nvim-web-devicons").set_icon {
  -- babelrc default icon cause babelrc in nvim-tree display uncorrectly
  [".babelrc"]={
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Babelrc"
  }
}
