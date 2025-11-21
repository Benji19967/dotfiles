-- TODO: maybe add icons to show up rather than ("Text", "Variable", ...)

return {
  -- Neovim LSP source for nvim-cmp
  { "hrsh7th/cmp-nvim-lsp" },

  -- Optional: buffer words source
  { "hrsh7th/cmp-buffer" },

  -- Optional: path completions
  { "hrsh7th/cmp-path" },

  -- Optional: command line completions
  { "hrsh7th/cmp-cmdline" },

  -- Optional: lua completions
  { "hrsh7th/cmp-nvim-lua" },

  -- Optional: snippets
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
  { "saadparwaiz1/cmp_luasnip" },

  -- Completion engine: completion sources are installed from external repos and "sourced"
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- LuaSnip: required to load snippets from "friendly-snippets"
      require("luasnip.loaders.from_vscode").lazy_load()

      -- LuaSnip: load custom snippets
      -- vim.fn.stdpath("config") is .config/nvim
      local luasnip_loader = require("luasnip.loaders.from_lua")
      luasnip_loader.lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          -- Custom keymaps
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),

          -- DEFAULT start
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- DEFAULT end
        }),

        -- Add sources here
        sources = cmp.config.sources({
          { name = "luasnip", priority = 4 },
          { name = "nvim_lsp", priority = 3 },
          { name = "buffer", priority = 2 },
          { name = "path", priority = 1 },
        }),

        -- `/` cmdline setup.
        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        }),

        -- Can get similar effect by just using <Tab>
        -- `:` cmdline setup.
        -- cmp.setup.cmdline(":", {
        --   mapping = cmp.mapping.preset.cmdline(),
        --   sources = cmp.config.sources({
        --     { name = "path" },
        --   }, {
        --     {
        --       name = "cmdline",
        --       option = {
        --         ignore_cmds = { "Man", "!" },
        --       },
        --     },
        --   }),
        -- }),

        -- Styling
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })
    end,
  },
}
