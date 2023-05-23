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

config.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

config.solargraph.setup {
  filetypes = { 'ruby', 'rspec' },
}

lsp.setup()
