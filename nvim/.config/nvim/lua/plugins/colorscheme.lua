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
