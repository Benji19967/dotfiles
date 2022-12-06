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

-- Normal --
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

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>gf", ":lua require('telescope.builtin').git_files({ path_display = { 'truncate' } })<cr>", opts)
keymap("n", "<leader>gn", ":lua require('telescope.builtin').live_grep({cwd='/apps/home/labrecqb/benjamin/notes'})<cr>", opts)
keymap("n", "<leader>fn", ":lua require('telescope.builtin').find_files({cwd='/apps/home/labrecqb/benjamin/notes'})<cr>", opts)
keymap("n", "<leader>fl", ":lua require('telescope.builtin').find_files({cwd='/lxhome/labrecqb/dotfiles/nvim/.config/nvim'})<cr>", opts)
keymap("n", "<leader>fd", ":lua require('telescope.builtin').git_files({cwd='/apps/home/labrecqb/docbox'})<cr>", opts)
keymap("n", "<leader>gd", ":lua require('telescope.builtin').live_grep({cwd='/apps/home/labrecqb/docbox'})<cr>", opts)
keymap("n", "<leader>dd", ":lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>bb", ":lua require('telescope.builtin').buffers({})<cr>", opts)

-- NetRW
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Format
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting_sync()<cr>", opts)

-- Harpoon
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<C-p>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
--keymap("n", "<C-p>", "<cmd>Telescope harpoon marks<cr>", opts)
keymap("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<cr>", opts)
