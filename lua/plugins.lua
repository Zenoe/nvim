-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local packer = require("packer")
-- packer.reset()
packer.startup{
  function(use)
    -- Packer can manage itself
    -- it is recommended to put impatient.nvim before any other plugins
    use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }
    use "wbthomason/packer.nvim"
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }

    -- use {
    --   ft = "norg",
    --   after = "nvim-treesitter",
    --   "nvim-neorg/neorg",
    --   -- flag to update treesitter parser when updating
    --   run = ":Neorg sync-parsers",
    --   config = function()
    --     require("neorg").setup {
    --       load = {
    --         ["core.defaults"] = {}
    --       }
    --       -- configuration here
    --     }
    --   end,
    -- }
    use {
      "terryma/vim-expand-region"
    }
    use {
      "natecraddock/sessions.nvim",
      config = [[ require('plugins/session-manager') ]]
    }

    -- use {
    --   "xolox/vim-session",
    --   requires = {'xolox/vim-misc'}
    -- }
    use {
      -- A collection of common configurations for Neovim's built-in language server client
      "neovim/nvim-lspconfig",
      config = [[ require('plugins/lspconfig') ]]
    }


    -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = [[ require('plugins/hop') ]]
      -- config = function()
      --   -- you can configure Hop the way you like here; see :h hop-config
      --   require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      -- end
    }
    use{'tpope/vim-vinegar'}
    use {'wellle/targets.vim'}
    use {'andymass/vim-matchup'}
    use {'honza/vim-snippets'}
    use {'vim-scripts/YankRing.vim'}
    use {
      -- Show search index and count with nvim-hlslens.
      "SirVer/ultisnips"
    }
    use {
      -- Command line auto-completion via wilder.nvim.
      "gelguy/wilder.nvim",
      requires = {'romgrk/fzy-lua-native'},
      -- config = [[ require('plugins/wilder') ]]
      -- config = function()
      --   require('wilder').setup({
      --     modes = {':', '/', '?'}
      --   })
      -- end
    }
    use {
      "airblade/vim-rooter"
    }

    use {
      -- comment jsx
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function ()
        require'nvim-treesitter.configs'.setup {
          context_commentstring = {
            enable = true
          }
        }
      end
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
        })
      end
    }

    -- use { "williamboman/mason.nvim" }

    use {
      "williamboman/mason.nvim",
      config = [[ require('plugins/lsp_installer_nvim') ]],
      requires = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
      }
    }
    -- use {
    -- "williamboman/nvim-lsp-installer",
    --   config = [[ require('plugins/lsp_installer_nvim') ]],
    --   requires = {
    --     "neovim/nvim-lspconfig"
    --   }
    -- }

    use {
      -- vscode-like pictograms for neovim lsp completion items Topics
      "onsails/lspkind-nvim",
      config = [[ require('plugins/lspkind') ]]
    }
     --

    --[=[
    use {
      -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
      "nvim-lua/lsp-status.nvim",
      config = [[ require('plugins/lspstatus') ]]
    }
    ]=]

    use {
      -- A completion plugin for neovim coded in Lua.
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
        "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
        "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
        "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
        "hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
        "saadparwaiz1/cmp_luasnip" -- luasnip completion source for nvim-cmp
      },
      config = [[ require('plugins/cmp') ]]
    }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {
      "AndrewRadev/switch.vim"
    }
    -- use {
    --   "nvim-telescope/telescope-project.nvim"
    -- }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {
      "akinsho/toggleterm.nvim", tag = '*',
      config = [[ require('plugins/terminal') ]]
      -- config = function()
      --   require("toggleterm").setup{
      --     -- why? these configurations take effect only after PackerCompile and restart nvim
      --     size = 20,
      --   }
      -- end
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep"
      },
      config = [[ require('plugins/telescope') ]]
    }
    use {
      "windwp/nvim-autopairs",
      config = [[ require('plugins/autopairs') ]]
    }
    use {
      "tpope/vim-surround"
    }
    use {
      -- Snippet Engine for Neovim written in Lua.
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets" -- Snippets collection for a set of different programming languages for faster development.
      },
      config = [[ require('plugins/luasnip') ]]
    }

    use {
      --  colorscheme for (neo)vim
      "folke/tokyonight.nvim"
    }

    use {
      "vimpostor/vim-lumen"
    }

    use {
      -- Nvim Treesitter configurations and abstraction layer
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {
        "windwp/nvim-ts-autotag",
        "p00f/nvim-ts-rainbow"
      },
      config = [[ require('plugins/treesitter') ]]

    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = [[ require('plugins/blankline') ]]
    }

    use {
      "tpope/vim-eunuch"
    }

    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = [[ require('plugins/lualine') ]]
    }

    use {
      "TimUntersberger/neogit",
      requires = {"nvim-lua/plenary.nvim"},
      config = [[ require('plugins/neogit') ]]
    }

    -- use {
    --   "kyazdani42/nvim-tree.lua",
    --   requires = "kyazdani42/nvim-web-devicons",
    --   config = [[ require('plugins/nvim-tree') ]]
    -- }

    use {
      "ThePrimeagen/git-worktree.nvim",
      config = [[ require('plugins/git-worktree') ]]
    }

    use {
      "mhartington/formatter.nvim",
      config = [[ require('plugins/formatter') ]]
    }

    use {
      "kmonad/kmonad-vim"
    }

    use { "natecraddock/workspaces.nvim" }

    use {
      "lambdalisue/suda.vim"
    }

    if packer_bootstrap then
      require("packer").sync()
    end
  end
}
