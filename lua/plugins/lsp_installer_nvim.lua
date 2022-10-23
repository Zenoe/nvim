-- local mason = require("nvim-lsp-installer")
local mason = require("mason")

local masonLspconfig = require("mason-lspconfig")
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
  max_concurrent_installers = 4
})

masonLspconfig.setup({
  ensure_installed = {
    "quick-lint-js",
    -- "tsserver", -- for javascript
    "jsonls", -- for json
    -- "jdtls", -- for java
    -- "texlab", -- for latex
    -- "ltex",
    -- "pylsp", -- for python
    "sumneko_lua", -- for lua
    "yamlls",
    "bashls",
    "dockerls"
  },
})
---------------------------------------------------
-- local function make_server_ready(attach)
--   masonLspconfig.on_server_ready(
--     function(server)
--       local opts = {}
--       opts.on_attach = attach
--       opts.settings = {
--         Lua = {
--           diagnostics = { globals = {'vim'} }
--         }
--       }
-- -- Thissetup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
-- server:setup(opts)
-- vim.cmd [[ do User LspAttachBuffers ]]
--     end
--   )
-- end
---------------------------------------------------

---------------------------------------------------
local servers = {
  "tsserver", -- for javascript
  "jsonls", -- for json
  "jdtls", -- for java
  "texlab", -- for latex
  "ltex",
  "pylsp", -- for python
  "sumneko_lua", -- for lua
--  "gopls", -- for go
  "yamlls",
  "bashls",
  "dockerls"
}

-- setup the LS
require "plugins.lspconfig"
-- make_server_ready(On_attach) -- LSP mappings

-- install the LS
-- for _, name in pairs(servers) do
--   local server_is_found, server = masonLspconfig.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end
