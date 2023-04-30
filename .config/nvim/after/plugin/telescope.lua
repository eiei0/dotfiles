local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set('n', ',t', builtin.find_files, {})  -- fuzzy finder for all files
vim.keymap.set('n', ',f', builtin.git_files, {}) -- fuzzy finder for files tracked with git

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close
      }
    }
  }
}
