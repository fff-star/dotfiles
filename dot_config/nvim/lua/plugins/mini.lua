return {
    {
        'nvim-mini/mini.nvim',
        version = false,
        config = function()
            require('mini.icons').setup()
            require("mini.pairs").setup()
            require("mini.ai").setup()
            require("mini.surround").setup(
                {
                    mappings = {
                        add = 'ys',      -- Add surrounding in Normal and Visual modes
                        delete = 'ds',   -- Delete surrounding
                        replace = 'rs',  -- Replace surrounding
                        find = '',        -- Find surrounding (to the right)
                        find_left = '',   -- Find surrounding (to the left)
                        highlight = '',   -- Highlight surrounding
                        suffix_last = '', -- Suffix to search with "prev" method
                        suffix_next = '', -- Suffix to search with "next" method
                    }
                }
            )
        end,
    }
}
