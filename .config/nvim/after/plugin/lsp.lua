local lsp = require('lsp-zero')
local config = require('lspconfig')

lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'bufls',
  'gopls',
  'lua_ls',
  'solargraph'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

config.solargraph.setup {
  filetypes = { 'ruby', 'rspec' },
}

lsp.setup()
