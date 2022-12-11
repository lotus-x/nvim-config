vim.opt.termguicolors = true

vim.cmd([[highlight IndentBlanklineIndent1 guibg=#e6e9ef gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#eff1f5 gui=nocombine]])

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	char = "",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	-- show_trailing_blankline_indent = false,
	-- show_end_of_line = true,
	-- show_current_context = true,
	-- show_current_context_start = true,
})
