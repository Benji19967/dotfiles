-- Check if the current folder ends with "/dotfiles"
local current_dir = vim.fn.getcwd()
local is_dotfiles = current_dir:match("dotfiles$") ~= nil
local hidden_flags = is_dotfiles and " --hidden --exclude .git" or ""

-- fd skips hidden dirs, so .github/.gitea never show up outside of dotfiles.
-- Search them explicitly (only when they exist, fd errors on a missing path).
local ci_dirs = is_dotfiles and ""
  or '\nfor d in .github .gitea; do [ -d "$d" ] && fd -t f --hidden . "$d"; done; true'

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {
    files = {
      -- formatter = "path.filename_first",
      cmd = "fd -e py" .. hidden_flags .. "\n" .. "fd -t f -E '*.py'" .. hidden_flags .. ci_dirs,
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
