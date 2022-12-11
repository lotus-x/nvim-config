require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"dockerls",
		"golangci_lint_ls",
		"gopls",
		"sumneko_lua",
		"jsonls",
		"hls",
		"vimls",
		"tailwindcss",
		"cssls",
		"cssmodules_ls",
		"tsserver",
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"cspell",
		"golangci_lint",
		"revive",
		"staticcheck",
		"gofmt",
		"goimports",
		"goimports_reviser",
		"golines",
		"stylua",
		"selene",
		"prettier",
	},
})

require("mason-nvim-dap").setup({})
