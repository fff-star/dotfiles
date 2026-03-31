return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                shade_terminals = true,
                float_opts = {
                    border = 'curved',
                },
            })
            local term_h = require("toggleterm.terminal").Terminal:new({
                direction = "horizontal",
                size = 15,
                hidden = true
            })
            local term_f = require("toggleterm.terminal").Terminal:new({
                direction = "float",
                hidden = true
            })
            function _G.toggle_horizontal() term_h:toggle() end
            function _G.toggle_float() term_f:toggle() end
            local opts = { noremap = true, silent = true }
            vim.keymap.set({'n','t'}, [[<C-`>]], '<cmd>lua toggle_horizontal()<CR>', opts)
            vim.keymap.set('n', '<leader>t', '<cmd>lua toggle_float()<CR>', opts)
            function _G.set_terminal_keymaps()
                local t_opts = { buffer = 0 }
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], t_opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], t_opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], t_opts)
            end

            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end
    }
}
