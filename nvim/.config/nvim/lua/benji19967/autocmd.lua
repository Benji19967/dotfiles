-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*.py"},
--   command = "echo 'Entering a Python file'",
-- })

-- Format on saving file (using ":w")
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        vim.lsp.buf.format()
    end
})
