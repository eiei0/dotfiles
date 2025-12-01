-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Navigation
  "github/copilot.vim",
  {
    "preservim/nerdtree",
    lazy = false,  -- Load immediately on startup
  },
  "tpope/vim-surround",
  "jeffkreeftmeijer/vim-numbertoggle",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "kelly-lin/telescope-ag",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
  "christoomey/vim-tmux-navigator",
  "folke/trouble.nvim",

  -- Colors
  "morhetz/gruvbox",
  "nvim-lualine/lualine.nvim",

  -- Syntax
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
      },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    }
  },
  "tpope/vim-commentary",
  "derekprior/vim-trimmer",
  "j-hui/fidget.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

  -- Ruby/Rails
  "keith/rspec.vim",

  -- Golang
  "ray-x/go.nvim",

  -- Misc
  "vim-test/vim-test",
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
})
