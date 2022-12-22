-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("neo-tree").setup({
	close_if_last_window = true,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = true,
		group_empty_dirs = true,
		use_libuv_file_watcher = true,
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = true,
	},
})

vim.keymap.set("n", "<leader>e", ":Neotree<CR>")
vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>tb", ":Neotree float buffers toggle<CR>")
vim.keymap.set("n", "<leader>tg", ":Neotree float git_status toggle<CR>")
vim.keymap.set("n", "<leader>tr", ":Neotree reveal<CR>")
