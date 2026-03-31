return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({
                'python',
                'cpp',
                'rust',
                'lua',
                'vim',
                'c',
                'zig',
                "javascript",
                "go",
                "markdown",
                "markdown_inline",
            })

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'python', 'cpp', 'rust', 'lua', 'vim', 'c', 'zig', 'javascript', 'go', 'markdown',},
                callback = function()
                    vim.treesitter.start()
                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo[0][0].foldmethod = 'expr'
                end,
            })
        end,
    }
}
