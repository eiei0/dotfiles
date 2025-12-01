vim.opt.nu = true                                                           -- show current line number
vim.opt.relativenumber = true                               -- enable auto toggling between line number

vim.opt.tabstop = 2                              -- number of visual spaces per tab when vim reads file
vim.opt.softtabstop = 2                                         -- number of spaces in tab when editing
vim.opt.shiftwidth = 2                                                     -- use 2 blanks for smarttab
vim.opt.expandtab = true                                                             -- tabs are spaces

vim.opt.autoindent = true                     -- copy indent from current line when starting a new line
vim.opt.smartindent = true                      -- intelligent indentation after parentheses-like chars

vim.opt.swapfile = false                                                -- no swapfile for a new buffer
vim.opt.backup = false                                                              -- turn off backups
vim.opt.writebackup = false                                            -- no backup files while editing

vim.opt.smarttab = true                         -- <Tab> in front of a line inserts 'shiftwidth' blanks
vim.opt.modelines = 1                               -- only use setting at bottom of page for this file

vim.opt.hlsearch = false                         -- turn off search highlighting in favor of incrsearch
vim.opt.incsearch = true                          -- highlight all search pattern matches incrementally

vim.opt.synmaxcol = 128                        -- no syntax highlighting for lines longer than 128 cols

vim.g.mapleader = " "                                                        -- reset leader to <space>
