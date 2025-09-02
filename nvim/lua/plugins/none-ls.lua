return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    extra_filetypes = { "astro" },
                }),
                require("none-ls.diagnostics.eslint").with({
                    extra_filetypes = { "astro" },
                }),
            },
        })
    end,
}
