return {
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("monokai-pro").setup({
  --       filter = "light", -- this is the *light* version
  --     })
  --     vim.cmd("colorscheme monokai-pro")
  --   end,
  -- },
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.adwaita_darker = true -- for darker version
      -- vim.g.adwaita_disable_cursorline = true -- to disable cursorline
      -- vim.g.adwaita_transparent = true -- makes the background transparent
      vim.cmd("colorscheme adwaita")
    end,
  },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local c = require("vscode.colors").get_colors()
  --     require("vscode").setup({
  --       -- Alternatively set style in setup
  --       style = "light",
  --
  --       -- Enable transparent background
  --       -- transparent = true,
  --
  --       -- Enable italic comment
  --       italic_comments = true,
  --
  --       -- Enable italic inlay type hints
  --       italic_inlayhints = true,
  --
  --       -- Underline `@markup.link.*` variants
  --       underline_links = true,
  --
  --       -- Disable nvim-tree background color
  --       disable_nvimtree_bg = true,
  --
  --       -- Apply theme colors to terminal
  --       terminal_colors = true,
  --
  --       -- Override colors (see ./lua/vscode/colors.lua)
  --       color_overrides = {
  --         vscLineNumber = "#FFFFFF",
  --       },
  --
  --       -- Override highlight groups (see ./lua/vscode/theme.lua)
  --       group_overrides = {
  --         -- this supports the same val table as vim.api.nvim_set_hl
  --         -- use colors from this colorscheme by requiring vscode.colors!
  --         Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  --       },
  --     })
  --     vim.cmd("colorscheme vscode")
  --   end,
  -- },

  -- {
  --   "maxmx03/solarized.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {},
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = "light"
  --     require("solarized").setup(opts)
  --     vim.cmd.colorscheme("solarized")
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = true,
  --   opts = ...,
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },
}
