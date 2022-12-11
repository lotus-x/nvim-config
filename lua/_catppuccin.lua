require("catppuccin").setup({
	flavour = "latte",
	integrations = {
		telescope = true,
		beacon = true,
		nvimtree = true,
		neotree = true,
		mason = true,
		lsp_trouble = true,
		illuminate = true,
		ts_rainbow = true,
		gitsigns = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
		aerial = true,
		which_key = true,
		lsp_saga = true,
		noice = true,
		notify = true,
		cmp = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
	},
})
