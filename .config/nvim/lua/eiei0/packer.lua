vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
-- ================= Plugins =======================================================================================
  use "wbthomason/packer.nvim"                                                           -- nvim lua package manager
  use "github/copilot.vim"                                                                                -- ai help
-- ---------------- Navigation -------------------------------------------------------------------------------------
  use "preservim/nerdtree"
  use "tpope/vim-surround"                                                                -- change surrounding text
  use "jeffkreeftmeijer/vim-numbertoggle"                                 -- auto toggling between line number modes
  use { "nvim-telescope/telescope.nvim", tag = "0.1.6", requires = { { "nvim-lua/plenary.nvim" } } } -- fuzzy finder
  use { "kelly-lin/telescope-ag", requires = { "nvim-telescope/telescope.nvim" } }     -- lua silver searcher plugin
  use "christoomey/vim-tmux-navigator"                                             -- easy navigation b/w vim & tmux
-- ---------------- Colors -----------------------------------------------------------------------------------------
  use { "morhetz/gruvbox" }                                                                           -- colorscheme
  use { 'nvim-lualine/lualine.nvim' }                                                                  -- status bar
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
  use "lewis6991/gitsigns.nvim"                                                                -- git diff in gutter
  use "tpope/vim-fugitive"                                                                        -- vim git wrapper
-- ---------------- Ruby/Rails -------------------------------------------------------------------------------------
  use "keith/rspec.vim"                                                                 -- rspec syntax highlighting
-- ---------------- Golang -----------------------------------------------------------------------------------------
  use "ray-x/go.nvim"                                                            -- go neovim support written in lua
-- ---------------- Misc -------------------------------------------------------------------------------------------
  use "j-hui/fidget.nvim"                                                                    -- lsp progress spinner
  use "vim-test/vim-test"                                                          -- wrapper for running test suite
  use {                                                                                       -- refactoring library
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
end)

