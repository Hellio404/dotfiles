local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
		end,
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		opts = function()
			local default = require "plugins.configs.treesitter"
			local override = require "custom.configs.treesitter"
			local opts = vim.tbl_deep_extend("force", default, override)
			return opts
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = function()
			local default = require "plugins.configs.nvimtree"
			local override = require "custom.configs.nvimtree"
			local opts = vim.tbl_deep_extend("force", default, override)
			return opts
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
		},
		opts = {
			ensure_installed = require("custom.configs.lspconfig").ensure_installed
		}

	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		opts = function()
			return require("custom.configs.rust_tools")
		end,
		-- dependencies = "neovim/nvim-lspconfig",
		config = function(_, opts)
			opts.server.on_attach = require("plugins.configs.lspconfig").on_attach
			opts.server.capabilities = require("plugins.configs.lspconfig").capabilities
			require("rust-tools").setup(opts)
		end
	},
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = { "Copilot" },
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = false,
			},
			panel = { enabled = false },
		}
	},
	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton"
	},
	{
		"andweeb/presence.nvim",
		lazy = false,
	},
	{
		"cacharle/c_formatter_42.vim",
		cmd = "CFormatter42",
	},
	{
		"Pocco81/auto-save.nvim",
		event = "TextChanged",
		opts = {
			enable = false,
			execution_message = {
				message = "",
			},
			debounce_delay = 2000,
		}
	},
}

return plugins
