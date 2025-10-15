return {
    'saghen/blink.cmp',
    build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'enter',
            ['<C-y>'] = { 'cancel' },
            ['<Tab>'] = false
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0
            },
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                cmdline = {
                    enabled = function()
                        return not vim.fn.getcmdline():match("vimgrep")
                    end
                }
            }
        },
        fuzzy = { implementation = "lua" },
        cmdline = {
            keymap = { preset = "super-tab" },
            completion = { menu = { auto_show = true } },
        }
    },
    opts_extend = { "sources.default" }
}
