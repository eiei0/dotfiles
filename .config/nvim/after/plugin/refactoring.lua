require('refactoring').setup({})

require("telescope").load_extension("refactoring")
vim.keymap.set(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true, desc = "Open refactoring menu" }
)
