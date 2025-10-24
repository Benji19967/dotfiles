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

-- Add `type: ignore` add end of line using a keymap
vim.keymap.set("n", "<leader>ti", function()
    local line = vim.api.nvim_get_current_line()
    -- Check if it's already added to avoid duplication
    if not line:find("# type: ignore", 1, true) then
        -- Append to line with spacing
        line = line .. "  # type: ignore"
        vim.api.nvim_set_current_line(line)
    end
end, { desc = "Append '# type: ignore' to line" })

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

-- Telescope -- files
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fk", ":lua require('telescope.builtin').find_files({cwd='~/Writing/knowledge'})<cr>", opts)
keymap("n", "<leader>fd",
    ":lua require('telescope.builtin').find_files({cwd='~/apps/home/labrecqb/dotfiles', hidden=true})<cr>", opts)
keymap("n", "<leader>fn", ":lua require('telescope.builtin').find_files({cwd='~/apps/home/labrecqb/notes'})<cr>", opts)
keymap("n", "<leader>fp", ":lua require('telescope.builtin').find_files({cwd='~/apps/home/labrecqb'})<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>o", ":lua require('telescope.builtin').oldfiles({})<cr>", opts)

-- Telescope -- grep
keymap("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>gk", ":lua require('telescope.builtin').live_grep({cwd='~/Writing/knowledge'})<cr>", opts)
keymap("n", "<leader>gn", ":lua require('telescope.builtin').live_grep({cwd='~/apps/home/labrecqb/notes'})<cr>", opts)
keymap("n", "<leader>gp", ":lua require('telescope.builtin').live_grep({cwd='~/apps/home/labrecqb'})<cr>", opts)
keymap("n", "<leader>gr", ":lua require('telescope.builtin').live_grep({cwd='~/apps/home/labrecqb/rust_sandbox'})<cr>",
    opts)
keymap("n", "<leader>gd",
    ":lua require('telescope.builtin').live_grep({vimgrep_arguments = { 'rg', '--color=never', '--hidden', '--with-filename', '--line-number', '--column', '--smart-case' }})<cr>"
    , opts)

keymap("n", "<leader>w", ":lua require('telescope.builtin').buffers({})<cr>", opts)
keymap("n", "<leader>s", ":lua require('telescope.builtin').lsp_document_symbols({})<cr>", opts)

-- Telescope -- definitions and references
keymap("n", "gd", ":lua require('telescope.builtin').lsp_definitions({noremap=true, silent=true})<cr>", opts)
keymap("n", "gr", ":lua require('telescope.builtin').lsp_references({noremap=true, silent=true})<cr>", opts)
keymap("n", "gs", ":lua require('telescope.builtin').grep_string({noremap=true, silent=true})<cr>", opts)
-- Shows all diagnostics
-- keymap("n", "gl", ":lua require('telescope.builtin').diagnostics({noremap=true, silent=true})<cr>", opts)

-- Telescope -- projects
keymap("n", "<leader>p",
    ":lua require('telescope').extensions.projects.projects({noremap=true, silent=true})<cr>", opts)

-- NetRW
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Format
keymap("n", "<leader>d", ":lua vim.lsp.buf.format({async=true})<cr>", opts)

-- Markdown
keymap("n", "<leader>m", ":MarkdownPreview<cr>", opts)

-- Replace
keymap("n", "<leader>r", ":%s//gc<LEFT><LEFT><LEFT>", opts)

-- Rename using LSP
keymap("n", "<leader>n", ":lua vim.lsp.buf.rename()<cr>", opts)
