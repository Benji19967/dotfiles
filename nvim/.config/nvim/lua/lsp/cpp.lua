-- Required for Raspberry Pi

-- TODO: confirm this works

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
    -- This tells lspconfig to use the 'clangd' executable in your PATH
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})
