local lsp_zero = require('lsp-zero')

-- lsp_zero v4 setup
lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = function(client, bufnr)
    -- Default keymaps
    lsp_zero.default_keymaps({buffer = bufnr})
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'gopls', 'solargraph', 'lua_ls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- Custom handler for solargraph
    solargraph = function()
      require('lspconfig').solargraph.setup({
        filetypes = { 'ruby', 'rspec' },
      })
    end,

    -- Custom handler for gopls with performance optimizations
    gopls = function()
      require('lspconfig').gopls.setup({
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
      })
    end,

    -- Custom handler for lua_ls to fix vim global warnings
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            }
          }
        }
      })
    end,
  },
})

require('go').setup()
