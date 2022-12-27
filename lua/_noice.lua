require("noice").setup({
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("telescope")
end, {})
