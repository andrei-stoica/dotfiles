---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- harpoon
    ["H"] = {function() require("harpoon.ui").toggle_quick_menu() end, "Open Harpoon" },
    ["<leader>a"] = {function() require("harpoon.mark").add_file() end, "Add file to Harpoon"},
    ["<leader>s"] = {function() require("harpoon.ui").nav_file(1) end, "Switch to file 1"},
    ["<leader>d"] = {function() require("harpoon.ui").nav_file(2) end, "Switch to file 2"},
    ["<leader>f"] = {function() require("harpoon.ui").nav_file(3) end, "Switch to file 3"},
    ["<leader>g"] = {function() require("harpoon.ui").nav_file(4) end, "Switch to file 4"},

    -- navigation
    ["<C-d>"] = {"<C-d>zz", "1/2 page down"},
    ["<C-u>"] = {"<C-u>zz", "1/2 page up" },
    ["n"] = {"nzz", "find next"},
    ["N"] = {"Nzz", "find prev"},


  },
}

-- more keybinds!

return M
