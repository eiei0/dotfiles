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

require('go').setup()

lsp.setup()
