-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'windwp/nvim-autopairs'
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use 'kyazdani42/nvim-web-devicons'
    use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
    use { "ellisonleao/glow.nvim" }

    -- cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets
    use 'L3MON4D3/LuaSnip'             -- snippet engine
    use 'rafamadriz/friendly-snippets' -- bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Vimux
    -- Docs: https://raw.githubusercontent.com/preservim/vimux/master/doc/vimux.txt
    use "preservim/vimux"

    -- Vim-slime
    use "jpalardy/vim-slime"

    -- Colorschemes
    use 'morhetz/gruvbox'
    use "folke/tokyonight.nvim"

    -- Markdown preview in browser
    use "iamcco/markdown-preview.nvim"

    -- Quickly navigate to projects
    use "ahmedkhalf/project.nvim"

    -- Multi-cursor
    use 'mg979/vim-visual-multi'

    -- Jupyter Notebooks
    -- use 'luk400/vim-jukit'
end)
