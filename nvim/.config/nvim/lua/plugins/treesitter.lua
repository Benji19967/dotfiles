-- Health checks
-- :checkhealth nvim-treesitter
-- Open a file and run this to see which parser is active:
-- :TSModuleInfo

-- Manual install of a parser:
-- :TSInstall python
--
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  main = "nvim-treesitter.config",
  opts = {
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
      "java",
      "markdown",
      "markdown_inline",
    },
    ignore_install = { "phpdoc" },
    highlight = {
      enable = true,
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
  },
}
