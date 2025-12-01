local lsp = require('lsp-zero')
local config = require('lspconfig')

lsp.preset({})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

config.solargraph.setup {
  filetypes = { 'ruby', 'rspec' },
}

-- Optimize gopls for better performance
config.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = false,
      },
      staticcheck = false,
      gofumpt = true,
      hints = {
        assignVariableTypes = false,
        compositeLiteralFields = false,
        compositeLiteralTypes = false,
        constantValues = false,
        functionTypeParameters = false,
        parameterNames = false,
        rangeVariableTypes = false,
      },
    },
  },
}

require('go').setup()

lsp.setup()
