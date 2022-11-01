-- options for lsp diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    signs = true,
    update_in_insert = true,
    virtual_text = {
      true,
      spacing = 6
      --severity_limit='Error'  -- Only show virtual text on error
    }
  }
)

-- setup to let js lsp start
require('lspconfig')['tsserver'].setup{
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
      -- https://stackoverflow.com/a/70294761/3113626
      -- use the nvim-lsp-ts-utils plugin to filter out this specific diagnostic message while keeping suggestions
      -- on_attach = function(client, bufnr)
      --     require('nvim-lsp-ts-utils').setup({
      --         filter_out_diagnostics_by_code = { 80001 },
      --     })
      --     require('nvim-lsp-ts-utils').setup_client(client)
      -- end,
}
require'lspconfig'.eslint.setup{
  -- settings = {
  --   parserOptions={
  --     ecmaVersion = 6,
  --   },
  -- }
}
require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}

-- require("lspconfig").texlab.setup {
--   settings = {
--     texlab = {
--       auxDirectory = "build/pdf",
--       rootDirectory = ".",
--       chktex = {
--         onEdit = true
--       },
--       build = {
--         executable = "latexmk",
--         forwardSearchAfter = false,
--         onSave = true
--       }
--     }
--   }
-- }
--
-- require("lspconfig").ltex.setup(
--   {
--     settings = {
--       ltex = {
--         enabled = {"latex", "tex", "bib", "markdown", "text", "txt"},
--         diagnosticSeverity = "information",
--         setenceCacheSize = 2000,
--         additionalRules = {
--           enablePickyRules = true,
--           motherTongue = "de"
--         },
--         trace = {server = "verbose"},
--         dictionary = {},
--         disabledRules = {},
--         hiddenFalsePositives = {}
--       }
--     }
--   }
-- )
--
-- se LSP diagnostic symbols/signs
vim.api.nvim_command [[ sign define LspDiagnosticsSignError         text=✗ texthl=LspDiagnosticsSignError       linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignWarning       text=⚠ texthl=LspDiagnosticsSignWarning     linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignInformation   text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignHint          text= texthl=LspDiagnosticsSignHint        linehl= numhl= ]]
