local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		use({ "catppuccin/nvim", as = "catppuccin" })

		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})

		use("danilamihailov/beacon.nvim")

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		})

		use({
			"nvim-neo-tree/neo-tree.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-context",

			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"jayp0521/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"jose-elias-alvarez/null-ls.nvim",
			"jayp0521/mason-null-ls.nvim",
			"jose-elias-alvarez/typescript.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		use({
			"folke/trouble.nvim",
			requires = "nvim-tree/nvim-web-devicons",
		})

		use({
			"numToStr/Comment.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
		})

		use("windwp/nvim-autopairs")

		use("windwp/nvim-ts-autotag")

		use({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		})

		use({
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		})

		use("RRethy/vim-illuminate")

		use("p00f/nvim-ts-rainbow")

		use("lukas-reineke/indent-blankline.nvim")

		use("lewis6991/gitsigns.nvim")

		use("norcalli/nvim-colorizer.lua")

		use("SmiteshP/nvim-navic")

		use("stevearc/aerial.nvim")

		use("folke/which-key.nvim")

		use("akinsho/toggleterm.nvim")

		-- use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

		use("rcarriga/nvim-notify")

		use("b0o/schemastore.nvim")

		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
		})

		use({
			"windwp/nvim-spectre",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
			},
		})

		use({
			"folke/noice.nvim",
			requires = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		})

		use({
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
		})

		use("echasnovski/mini.nvim")

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		use("LudoPinelli/comment-box.nvim")

		use({ "kevinhwang91/nvim-hlslens" })

		use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

		use({ "ggandor/leap.nvim" })

		use({
			"ThePrimeagen/harpoon",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
