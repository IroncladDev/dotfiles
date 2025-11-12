vim.filetype.add({
    extension = {
        kbd = "kanata",
    }
})

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "html", "css", "rust", "astro", "kanata" },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
        })

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.kanata = {
            install_info = {
                url = "https://github.com/postsolar/tree-sitter-kanata",
                files = { "src/parser.c" },
                branch = "master",
            },
            filetype = "kanata",
        }
    end,
}
