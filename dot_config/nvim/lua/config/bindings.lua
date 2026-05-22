local opt = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "Q", "<NOP>", opt)
vim.keymap.set("i", "jk", "<ESC>", opt)
vim.keymap.set("n", "<Leader>w", ":w<CR>", opt)
vim.keymap.set("n", "<Leader>q", ":q<CR>", opt)

vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)

vim.keymap.set("n", "<Leader>1", ":tabn 1<CR>", opt)
vim.keymap.set("n", "<Leader>2", ":tabn 2<CR>", opt)
vim.keymap.set("n", "<Leader>3", ":tabn 3<CR>", opt)
vim.keymap.set("n", "<Leader>4", ":tabn 4<CR>", opt)
vim.keymap.set("n", "<Leader>5", ":tabn 5<CR>", opt)
vim.keymap.set("n", "<Leader>6", ":tabn 6<CR>", opt)
vim.keymap.set("n", "<Leader>7", ":tabn 7<CR>", opt)
vim.keymap.set("n", "<Leader>8", ":tabn 8<CR>", opt)
vim.keymap.set("n", "<Leader>9", ":tabn 9<CR>", opt)

vim.keymap.set('n', '<M-y>', '<cmd>vertical resize -2<CR>', opt)
vim.keymap.set('n', '<M-u>', '<cmd>resize +2<CR>', opt)
vim.keymap.set('n', '<M-i>', '<cmd>resize -2<CR>', opt)
vim.keymap.set('n', '<M-o>', '<cmd>vertical resize +2<CR>', opt)
vim.keymap.set("n", "<Leader>v", ":vsp<CR>", opt)
vim.keymap.set("n", "<Leader>s", ":sp<CR>", opt)
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<Leader>b", "<cmd>bwipeout<CR>", { silent = true })
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<C-S-I>", vim.lsp.buf.format, opt)
vim.keymap.set('n', '[g', function()
    vim.diagnostic.jump({ count = -1 })
end)
vim.keymap.set('n', ']g', function()
    vim.diagnostic.jump({ count = 1 })
end)
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() ~= 0 then
        return '<C-n>'
    else
        return '<Tab>'
    end
end, { expr = true, silent = true })

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() ~= 0 then
        return '<C-y>'
    else
        return '<CR>'
    end
end, { expr = true, silent = true })
