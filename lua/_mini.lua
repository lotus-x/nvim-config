local map = require("mini.map")

map.setup({
	integrations = {
		map.gen_integration.builtin_search(),
		map.gen_integration.gitsigns(),
		map.gen_integration.diagnostic(),
	},
})

vim.keymap.set("n", "<Leader>mc", map.close)
vim.keymap.set("n", "<Leader>mf", map.toggle_focus)
vim.keymap.set("n", "<Leader>mo", map.open)
vim.keymap.set("n", "<Leader>mr", map.refresh)
vim.keymap.set("n", "<Leader>ms", map.toggle_side)
vim.keymap.set("n", "<Leader>mt", map.toggle)

require("mini.sessions").setup({})
