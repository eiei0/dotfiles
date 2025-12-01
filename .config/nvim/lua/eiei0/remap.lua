vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                       -- auto indent while in visual line mode and shift + J/K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")                        -- capital j keeps cursor in place instead of moving to end of line

vim.keymap.set("x", "<leader>p", [["_dP]])                            -- keeps the copied text after pasting over other text

vim.keymap.set("n", "<leader>]", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])   -- search and replace within file

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })                  -- make current file executable

vim.keymap.set("n", "<leader>bp", "orequire 'pry'; binding.pry<esc>^")                               -- insert ruby debugger

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")                                                 -- easy navigation between splits
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])                                      -- easy copy/paste to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
