-- Set keymaps on VimEnter to ensure NERDTree commands are available
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.keymap.set("n", "<leader>v", ":NERDTreeToggle<CR>", { noremap = true, desc = "Toggle NERDTree" })
    vim.keymap.set("n", "<leader>f", ":NERDTreeFind<CR>", { noremap = true, desc = "NERDTree find current file" })
  end,
})

vim.cmd [[
  let NERDTreeAutoDeleteBuffer = 1                              " auto delete buffer of file deleted
  let NERDTreeMinimalUI = 1                                                             " minimal ui
  let NERDTreeDirArrows = 1
  let NERDTreeShowHidden=1                                                        " Show hidden files
  let NERDTreeQuitOnOpen = 1                                      " quit NERDTree when opening a file
  let NERDTreeIgnore = ['\.DS_Store']                                            " ignore index files
]]
