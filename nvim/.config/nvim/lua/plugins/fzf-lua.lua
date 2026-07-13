-- Check if the current folder ends with "/dotfiles"
local current_dir = vim.fn.getcwd()
local is_dotfiles = current_dir:match("dotfiles$") ~= nil
local hidden_flags = is_dotfiles and " --hidden --exclude .git" or ""

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {
    files = {
      -- formatter = "path.filename_first",
      cmd = "fd -e py" .. hidden_flags .. "\n" .. "fd -t f -E '*.py'" .. hidden_flags,
    },
    oldfiles = {
      -- formatter = "path.filename_first",
      cwd_only = true,
      include_current_session = true,
    },
    buffers = {
      formatter = "path.filename_first",
    },
  },
}
