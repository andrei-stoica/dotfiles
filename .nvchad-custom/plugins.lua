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
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        r_language_server = {},
        julials = {},
        marksman = {
          -- also needs:
          -- $home/.config/marksman/config.toml :
          -- [core]
          -- markdown.file_extensions = ["md", "markdown", "qmd"]
          filetypes = { "markdown", "quarto" },
          root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
        },
      },
    },
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
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = true,
        },
      })
    end,
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

  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    lazy = false,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- ft = {
    -- 	"BufReadPre ~/Notes/**.md",
    -- 	"BufNewFile ~/Notes/**.md",
    -- },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        { name = "second-brain", path = "~/second-brain" },
      },
      new_notes_location = "notes_subdir",
      daily_notes = { folder = "notes/dailies" },
    },
  },

  -- Disable nvchad plugins
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "quarto-dev/quarto-nvim",
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html", "lua" },
      },
    },
    ft = "quarto",
    keys = {
      { "<leader>qa",   ":QuartoActivate<cr>",                           desc = "quarto activate" },
      { "<leader>qp",   ":lua require'quarto'.quartoPreview()<cr>",      desc = "quarto preview" },
      { "<leader>qq",   ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh",   ":QuartoHelp ",                                  desc = "quarto help" },
      { "<leader>qe",   ":lua require'otter'.export()<cr>",              desc = "quarto export" },
      { "<leader>qE",   ":lua require'otter'.export(true)<cr>",          desc = "quarto export overwrite" },
      { "<leader>qrr",  ":QuartoSendAbove<cr>",                          desc = "quarto run to cursor" },
      { "<leader>qra",  ":QuartoSendAll<cr>",                            desc = "quarto run all" },
      { "<leader><cr>", ":SlimeSend<cr>",                                desc = "send code chunk" },
      { "<c-cr>",       ":SlimeSend<cr>",                                desc = "send code chunk" },
      { "<c-cr>",       "<esc>:SlimeSend<cr>i",                          mode = "i",                      desc = "send code chunk" },
      { "<c-cr>",       "<Plug>SlimeRegionSend<cr>",                     mode = "v",                      desc = "send code chunk" },
      { "<cr>",         "<Plug>SlimeRegionSend<cr>",                     mode = "v",                      desc = "send code chunk" },
      { "<leader>ctr",  ":split term://R<cr>",                           desc = "terminal: R" },
      { "<leader>cti",  ":split term://ipython<cr>",                     desc = "terminal: ipython" },
      { "<leader>ctp",  ":split term://python<cr>",                      desc = "terminal: python" },
      { "<leader>ctj",  ":split term://julia<cr>",                       desc = "terminal: julia" },
    },
  },

  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
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
