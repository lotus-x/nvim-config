vim.opt.termguicolors = true

local color_pallete = require("catppuccin.palettes").get_palette()

vim.cmd([[highlight IndentBlanklineIndent1 guibg=]] .. color_pallete.mantle .. [[ gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=]] .. color_pallete.base .. [[ gui=nocombine]])

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
