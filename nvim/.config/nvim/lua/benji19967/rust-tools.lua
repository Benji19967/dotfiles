-- Need to enable in init.lua, as well as uncommenting, to re-enable.

-- local rt = require("rust-tools")
--
-- rt.setup({
--     server = {
--         on_attach = function(_, bufnr)
--             -- Hover actions
--             vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
--             -- Code action groups
--             vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--         end,
--         -- https://gist.github.com/tivrfoa/e956f090ff549e9dd04c9ececd3912f1
--         settings = {
--             ["rust-analyzer"] = {
--                 -- enable clippy on save
--                 checkOnSave = {
--                     command = "clippy"
--                 },
--             }
--         }
--     },
-- })
