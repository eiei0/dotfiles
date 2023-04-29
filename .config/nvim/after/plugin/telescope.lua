local builtin = require('telescope.builtin')

vim.keymap.set('n', ',t', builtin.find_files, {})  -- fuzzy finder for all files 
vim.keymap.set('n', ',f', builtin.git_files, {}) -- fuzzy finder for files tracked with git
