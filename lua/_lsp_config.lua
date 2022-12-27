-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	local navic = require("nvim-navic")

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	local lsp_formatting = function()
		vim.lsp.buf.format({
			filter = function(client)
				print(client.name)
				-- check haskell
				if client.name == "hls" and #vim.lsp.get_active_clients({ name = "hls", bufnr = bufnr }) > 0 then
					return true
				end
				-- apply whatever logic you want (in this example, we'll only use null-ls)
				return client.name == "null-ls"
			end,
			async = true,
		})
	end

	vim.keymap.set("n", "<space>f", function()
		lsp_formatting()
	end, opts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- local lspconfig = require("lspconfig")
-- local lsp_defaults = lspconfig.util.default_config
--
-- local capabilities =
-- 	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").dockerls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
require("lspconfig").jsonls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
require("lspconfig").hls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").vimls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").tailwindcss.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").cssls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").cssmodules_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("typescript").setup({
	server = {
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	},
})
require("go").setup({
	lsp_cfg = {
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	},
	luasnip = true,
})
