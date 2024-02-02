local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"folke/twilight.nvim",
		opts = {
			context = 20,
			expand = {
				"function",
			},
		},
		lazy = false,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			tmux = {
				enable = false,
			},
		},
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		lazy = false,
	},
	-- Override plugin definition options

	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		setup = {
			ensure_installed = { "jedi" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context", lazy = false },

	{
		"theprimeagen/harpoon",
	},

	{
		"simrat39/rust-tools.nvim",
	},

	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		event = "BufEnter *.md",
	},

	-- Disable nvchad plugins

	{
		"tpope/vim-sleuth",
		lazy = false,
	},

	{ "NvChad/nvterm",                           enabled = false },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
