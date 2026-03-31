vim.opt.number = true
vim.opt.shortmess:append("I")
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.laststatus = 3
vim.opt.autoindent = true
vim.opt.scrolloff = 6
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.synmaxcol = 300
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.foldlevel = 999
vim.opt.clipboard = "unnamedplus"
vim.cmd("syntax enable")
vim.diagnostic.config({ virtual_text = true })
