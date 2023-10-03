local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- <A-j> is Option + j

-- ##############
-- ### Normal ###
-- ##############
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertial resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Zoom in and out of buffer
keymap("n", "Zz", "<C-w>_ <C-w>|", opts)
keymap("n", "Zo", "<C-w>=", opts)

-- Open last buffer
keymap("n", "<C-Tab>", ":bprevious<CR>", opts)

-- Comment
-- This works for Ctrl-_ and Ctrl-/
keymap("n", "<C-_>", ":normal gcc<CR>", opts)

-- ##############
-- ### Insert ###
-- ##############
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- ##############
-- ### Visual ###
-- ##############
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)

-- Comment
-- This works for Ctrl-_ and Ctrl-/
keymap("v", "<C-_>", ":normal gcc<CR>", opts)

-- ####################
-- ### Visual Block ###
-- ####################
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ################
-- ### Terminal ###
-- ################
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Telescope
--[[ keymap("n", "<leader>pp", ":vim ~/apps/home/labrecqb<cr>", opts) ]]
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>gn", ":lua require('telescope.builtin').live_grep({cwd='~/apps/home/labrecqb/notes'})<cr>", opts)
keymap("n", "<leader>fn", ":lua require('telescope.builtin').find_files({cwd='~/apps/home/labrecqb/notes'})<cr>", opts)
keymap("n", "<leader>fd",
    ":lua require('telescope.builtin').find_files({cwd='~/apps/home/labrecqb/dotfiles', hidden=true})<cr>", opts)
keymap("n", "<leader>w", ":lua require('telescope.builtin').buffers({})<cr>", opts)
keymap("n", "<leader>s", ":lua require('telescope.builtin').lsp_document_symbols({})<cr>", opts)
keymap("n", "<leader>o", ":lua require('telescope.builtin').oldfiles({})<cr>", opts)

-- NetRW
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Format
keymap("n", "<leader>d", ":lua vim.lsp.buf.format({async=true})<cr>", opts)
