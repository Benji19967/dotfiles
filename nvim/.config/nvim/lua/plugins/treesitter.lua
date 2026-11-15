-- nvim-treesitter (main branch)
-- Requires the tree-sitter CLI: `brew install tree-sitter-cli`
--
-- Health checks
-- :checkhealth nvim-treesitter
-- Inspect the active parser/highlights under the cursor:
-- :Inspect / :InspectTree
--
-- Manual install of a parser:
-- :TSInstall python

local parsers = {
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
  "vim",
  "vimdoc",
  "query",
  -- elixir
  "elixir",
  "heex",
  "eex",
  -- misc
  "sql",
  "dockerfile",
  "yaml",
  "toml",
}

-- filetypes where treesitter highlighting should NOT be used
local highlight_disable = { latex = true, tex = true }
-- filetypes where treesitter indentation should NOT be used
local indent_disable = { yaml = true }

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})

    -- install missing parsers (no-op for already installed ones)
    ts.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
      callback = function(args)
        local ft = args.match
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang or highlight_disable[ft] then
          return
        end
        -- only start if a parser for this language is available
        if not pcall(vim.treesitter.start, args.buf, lang) then
          return
        end
        if not indent_disable[ft] then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
