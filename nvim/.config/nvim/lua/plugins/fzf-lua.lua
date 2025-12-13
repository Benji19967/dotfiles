return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {
    files = {
      formatter = "path.filename_first",
    },
    oldfiles = {
      formatter = "path.filename_first",
      cwd_only = true,
    },
    buffers = {
      formatter = "path.filename_first",
    },
  },
}
