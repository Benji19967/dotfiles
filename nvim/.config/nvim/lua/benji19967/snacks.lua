local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
    return
end

snacks.setup({
    lazygit = {
        config = {
            gui = {
                nerdFontsVersion = "",
            },
        },
        theme = {
            activeBorderColor = { fg = "Directory" },
        },
    },
    image = {

    }
})
