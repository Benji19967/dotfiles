return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    filters = {
      -- dotfiles = true, -- hides dotfiles (e.g. `.git`, `.env`)
      custom = {
        "^env$", -- hide `env`
        "^__pycache__$",
      },
      -- git_ignored = true, -- hides files in .gitignore
    },
    git = {
      enable = true,
      -- Show files and dirs mentioned in .gitignore in tree
      ignore = false,
      timeout = 500,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },

    -- TODO: remove this?
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
        },
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            deleted = "",
            untracked = "",
            ignored = "",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
      },
      highlight_git = true,
    },
    -- renderer = {
    --   root_folder_modifier = ":t",
    --   icons = {
    --     glyphs = {
    --       default = "",
    --       symlink = "",
    --       folder = {
    --         arrow_open = "",
    --         arrow_closed = "",
    --         default = "",
    --         open = "",
    --         empty = "",
    --         empty_open = "",
    --         symlink = "",
    --         symlink_open = "",
    --       },
    --       git = {
    --         unstaged = "",
    --         staged = "S",
    --         unmerged = "",
    --         renamed = "➜",
    --         untracked = "U",
    --         deleted = "",
    --         ignored = "◌",
    --       },
    --     },
    --   },
    -- },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      severity = {
        min = vim.diagnostic.severity.WARN, -- only show WARN and ERROR (HINT and INFO ignored)
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "right",
    },
    actions = {
      open_file = {
        -- If True: makes sure tree stays closed when opening a new file
        quit_on_open = False,
      },
    },
  },
}
