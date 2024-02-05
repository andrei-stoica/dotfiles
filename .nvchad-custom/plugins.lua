local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"folke/twilight.nvim",
		opts = {
			context = 20,
			expand = {
				"function",
			}, },
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
		"alexghergh/nvim-tmux-navigation",
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

	{
		"debugloop/telescope-undo.nvim",
		dependencies = { -- note how they're inverted to above example
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		keys = {
			{ -- lazy style key map
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "undo history",
			},
		},
		opts = {
			-- don't use `defaults = { }` here, do this in the main telescope spec
			extensions = {
				undo = {
					-- telescope-undo.nvim config, see below
				},
				-- no other extensions here, they can have their own spec too
			},
		},
		config = function(_, opts)
			-- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
			-- configs for us. We won't use data, as everything is in it's own namespace (telescope
			-- defaults, as well as each extension).
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},

	{
		"sindrets/diffview.nvim",
		lazy = false,
	},

	{
		"NvChad/nvterm",
		enabled = false,
	},

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
