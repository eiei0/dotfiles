vim.keymap.set('n', '<Leader>r', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>s', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>a', ':TestSuite<CR>')

vim.g["test#strategy"] = "neovim" -- execute test commands in a split window
