vim.cmd [[
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'mikavilpas/yazi.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
]]
require("plugins.yazi")
require("plugins.md-preview")
require("plugins.tree-sitter")
require("plugins.coc-nvim")
