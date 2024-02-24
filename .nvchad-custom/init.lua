-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.number = true
vim.opt.linebreak = true
vim.opt.showbreak = "+++"
vim.opt.showmatch = true
vim.opt.visualbell = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.undolevels = 1000
vim.opt.backspace = "indent,eol,start"
vim.opt.colorcolumn = "80"
vim.opt.conceallevel = 2
