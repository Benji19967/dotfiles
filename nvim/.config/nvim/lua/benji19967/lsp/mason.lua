-- Reference: https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/mason.lua

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "pyright",
    -- "jsonls",
    -- "lua_ls",
    -- "ocamllsp",
    -- "rust_analyzer", -- Just adding this line and restarting Neovim added LSP for Rust
    -- "ruff",
    "clangd",        -- LSP for C/C++
    -- "gopls",         -- `:Mason`, `click 'i' on "gopls"`, add this line. Done, you have LSP for Go.
    "julials",       -- `:Mason`, `click 'i' on "julia-lsp"`, add this line. Done, you have LSP for Julia.
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status_ok then
--     return
-- end

local opts = {}


for _, server in pairs(servers) do
    opts = {
        on_attach = require("benji19967.lsp.handlers").on_attach,
        capabilities = require("benji19967.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require "benji19967.lsp.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "lua_ls" then
        --[[ local l_status_ok, lua_dev = pcall(require, "lua-dev") ]]
        --[[ if not l_status_ok then ]]
        --[[   return ]]
        --[[ end ]]
        local sumneko_opts = require "benji19967.lsp.settings.lua_ls"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        --[[ opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts) ]]
        --[[ local luadev = lua_dev.setup { ]]
        --[[   --   -- add any options here, or leave empty to use the default settings ]]
        --[[   -- lspconfig = opts, ]]
        --[[   lspconfig = { ]]
        --[[     on_attach = opts.on_attach, ]]
        --[[     capabilities = opts.capabilities, ]]
        --[[     --   -- settings = opts.settings, ]]
        --[[   }, ]]
        --[[ } ]]
        --[[ lspconfig.lua_ls.setup(luadev) ]]
        --
        vim.lsp.enable(sumneko_opts)
        -- DEPRECATED
        -- lspconfig.lua_ls.setup(sumneko_opts)
        -- DEPRECATED

        goto continue
    end

    if server == "pyright" then
        local pyright_opts = require "benji19967.lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "rust_analyzer" then
        local rust_analyzer_opts = require "benji19967.lsp.settings.rust_analyzer"
        opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
    end

    -- lspconfig[server].setup(opts)
    vim.lsp.enable(server)
    ::continue::
end
