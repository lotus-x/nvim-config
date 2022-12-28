require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	shade_terminals = false,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local update_neo_tree_git_status = function()
	require("neo-tree.events").fire_event("git_event")
end

local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	highlights = {
		NormalFloat = {
			guibg = "#24273a",
			guifg = "#cad3f5",
		},
	},
	on_close = update_neo_tree_git_status,
})
function _lazygit_toggle()
	lazygit:toggle()
end

local gitui = Terminal:new({
	cmd = "gitui -t latte.ron",
	hidden = true,
	direction = "float",
	on_close = update_neo_tree_git_status,
})
function _gitui_toggle()
	gitui:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>lua _gitui_toggle()<CR>", { noremap = true, silent = true })
