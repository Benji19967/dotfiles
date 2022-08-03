set nu
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()

set completeopt=menuone,noinsert,noselect
" lua require('lspconfig').pylsp.setup{ on_attach=require'coq'.on_attach }
" lua require('null-ls').setup({ sources =  { require('null-ls').builtins.formatting.black, }, })
set termguicolors
colorscheme gruvbox

" Remap

" Terminal remap
tnoremap <Esc> <C-\><C-n>
let mapleader = " "
