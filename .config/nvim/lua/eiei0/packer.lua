vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
-- ================= Plugins =======================================================================================
  use "wbthomason/packer.nvim"                                                           -- nvim lua package manager
-- ---------------- Navigation -------------------------------------------------------------------------------------
  use "preservim/nerdtree"
  use "tpope/vim-surround"                                                                -- change surrounding text
  use "jeffkreeftmeijer/vim-numbertoggle"                                 -- auto toggling between line number modes
  use { "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } } -- fuzzy finder
  use "christoomey/vim-tmux-navigator"                                             -- easy navigation b/w vim & tmux
-- ---------------- Colors -----------------------------------------------------------------------------------------
  use { "morhetz/gruvbox" }                                                                           -- colorscheme
-- ---------------- Syntax -----------------------------------------------------------------------------------------
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })                                      -- text parsing
  use {                                                                                               -- LSP support
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      {'hrsh7th/nvim-cmp'},                                                                        -- autocompletion
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  use "tpope/vim-commentary"                                                                       -- comment easily
  use "derekprior/vim-trimmer"                                                            -- trim whitespace on save
-- ---------------- Git --------------------------------------------------------------------------------------------
  use "airblade/vim-gitgutter"                                                                 -- git diff in gutter
  use "tpope/vim-fugitive"                                                                        -- vim git wrapper
-- ---------------- Ruby/Rails -------------------------------------------------------------------------------------
  use "keith/rspec.vim"                                                                 -- rspec syntax highlighting
-- ---------------- Misc -------------------------------------------------------------------------------------------
  use "907th/vim-auto-save"                                                     -- save everytime buffer is modified
  use "vim-test/vim-test"                                                          -- wrapper for running test suite
end)

