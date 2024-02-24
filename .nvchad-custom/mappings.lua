---@type MappingsTable
local M = {}

local function toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

M.general = {
  n = {
    -- harpoon
    ["H"] = {
      function()
        local harpoon = require("harpoon")
        toggle_telescope(harpoon:list())
        --harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Open Harpoon in telescope",
    },
    ["<leader>hh"] = {
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Open Harpoon",
    },
    ["<leader>ha"] = {
      function()
        local harpoon = require("harpoon")
        harpoon:list():append()
      end,
      "Add file to Harpoon",
    },
    ["<leader>hs"] = {
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(1)
      end,
      "Switch to file 1",
    },
    ["<leader>hd"] = {
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(2)
      end,
      "Switch to file 2",
    },
    ["<leader>hf"] = {
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(3)
      end,
      "Switch to file 3",
    },
    ["<leader>hg"] = {
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(4)
      end,
      "Switch to file 4",
    },

    -- navigation
    ["<C-d>"] = { "<C-d>zz", "1/2 page down" },
    ["<C-u>"] = { "<C-u>zz", "1/2 page up" },
    ["n"] = { "nzz", "find next" },
    ["N"] = { "Nzz", "find prev" },

    ["Zm"] = { ":ZenMode<CR>", "Enter ZenMode" },
  },
}

-- more keybinds!

return M
