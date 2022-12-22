local null_ls = require("null-ls")

local eslint_condition = function(utils)
	return utils.root_has_file({
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json",
	})
end
local xo_condition = function(utils)
	return utils.root_has_file({
		".xo-config",
		".xo-config.json",
		".xo-config.js",
		"xo.config.js",
		".xo-config.cjs",
		"xo-config.cjs",
	})
end

null_ls.setup({
	sources = {
		-- ------------------------------------------------------------------ --
		--                                spell                               --
		-- ------------------------------------------------------------------ --

		null_ls.builtins.diagnostics.cspell.with({
			diagnostics_format = "#{m}",
		}),
		null_ls.builtins.code_actions.cspell,

		-- ------------------------------------------------------------------ --
		--                                 go                                 --
		-- ------------------------------------------------------------------ --

		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.revive,
		null_ls.builtins.diagnostics.staticcheck,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,

		-- ------------------------------------------------------------------ --
		--                                 lua                                --
		-- ------------------------------------------------------------------ --

		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.selene,

		null_ls.builtins.code_actions.gitsigns,

		-- typescript/javascript

		null_ls.builtins.formatting.prettier,
		null_ls.builtins.code_actions.eslint.with({
			condition = eslint_condition,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.eslint.with({
			condition = eslint_condition,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.tsc,
		require("typescript.extensions.null-ls.code-actions"),
		null_ls.builtins.code_actions.xo.with({
			condition = xo_condition,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.xo.with({
			condition = xo_condition,
			prefer_local = "node_modules/.bin",
		}),

		-- css

		-- null_ls.builtins.diagnostics.stylelint,
		-- null_ls.builtins.formatting.stylelint,
	},
	diagnostics_format = "[#{c}] #{m} (#{s})",
})

local lsp_formatting = function()
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		async = true,
	})
end

local opts = { silent = true }

vim.keymap.set("n", "<Leader>lf", function()
	lsp_formatting()
end, opts)

vim.keymap.set("n", "<Leader>nc", function()
	null_ls.toggle("cspell")
end, opts)
