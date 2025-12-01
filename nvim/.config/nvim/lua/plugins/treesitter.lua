-- Health checks
-- :checkhealth nvim-treesitter
-- Open a file and run this to see which parser is active:
-- :TSModuleInfo

-- Manual install of a parser:
-- :TSInstall python

return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      branch = "master",
      lazy = false,
      build = ":TSUpdate",
      ensure_installed = {
        "python",
        "lua",
        "javascript",
        "html",
        "css",
        "json",
        "bash",
        "regex",
        "c",
        "xml",
      },
      -- sync_install = true,
      ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "latex" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = { "yaml" } },
    })
  end,
}
