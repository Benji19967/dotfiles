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
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim' -- Easily comment stuff
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'ellisonleao/glow.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'ahmedkhalf/project.nvim',
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-fzy-native.nvim',
            -- Images (needs: popup, media-files, plenary)
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-lua/popup.nvim'
        },
    }

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
    use 'nvimtools/none-ls.nvim'
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
    use { "catppuccin/nvim", as = "catppuccin" }
    use "neanias/everforest-nvim"

    -- Markdown preview in browser
    use "iamcco/markdown-preview.nvim"

    -- Multi-cursor
    use 'mg979/vim-visual-multi'

    -- Jupyter Notebooks
    -- use 'luk400/vim-jukit'

    -- Rust tools
    use 'simrat39/rust-tools.nvim'

    -- Refactoring
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }

    -- Many quality of life plugins
    use "folke/snacks.nvim"
end)
