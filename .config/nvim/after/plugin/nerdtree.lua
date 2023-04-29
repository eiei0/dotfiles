vim.api.nvim_set_keymap("n", "<leader>v", ":NERDTreeToggle<CR>", { noremap = true }) -- Toggle NERDTree (Space-v)
vim.api.nvim_set_keymap("n", "<leader>f", ":NERDTreeFind<CR>", { noremap = true }) -- Toggle NERDTreeFind (Space-f)

vim.cmd [[
  let NERDTreeAutoDeleteBuffer = 1                              " auto delete buffer of file deleted
  let NERDTreeMinimalUI = 1                                                             " minimal ui
  let NERDTreeDirArrows = 1
  let NERDTreeShowHidden=1                                                        " Show hidden files
  let NERDTreeQuitOnOpen = 1                                      " quit NERDTree when opening a file
  let NERDTreeIgnore = ['\.DS_Store']                                            " ignore index files
]]
