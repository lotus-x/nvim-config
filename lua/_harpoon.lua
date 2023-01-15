require("harpoon").setup({})

require("telescope").load_extension("harpoon")

vim.keymap.set("n", "<leader>hn", function()
	return require("harpoon.mark").add_file()
end)
vim.keymap.set("n", "<leader>hh", function()
	return require("harpoon.ui").toggle_quick_menu()
end)
local hkeys = { "a", "s", "d", "f", "g" }
for i = 1, 5 do
	vim.keymap.set("n", "<leader>h" .. hkeys[i], function()
		return require("harpoon.ui").nav_file(i)
	end)
end
