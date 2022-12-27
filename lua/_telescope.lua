local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.cmd("autocmd User TelescopePreviewerLoaded setlocal wrap")
