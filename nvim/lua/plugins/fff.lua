return {
    "dmtrKovalenko/fff.nvim",
    enabled = false,
    build = function()
        require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    opts = {
        debug = {
            enabled = true,
            show_scores = true
        }
    },
}
