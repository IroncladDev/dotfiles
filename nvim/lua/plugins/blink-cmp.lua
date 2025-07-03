return {
  'saghen/blink.cmp',
  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-y>'] = { 'cancel' },
      ['<C-e>'] = { 'select_prev' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0
      }
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
    fuzzy = { implementation = "prefer_rust_with_warning" },
    cmdline = {
      keymap = { preset = "super-tab" },
      completion = { menu = { auto_show = true } },
    }
  },
  opts_extend = { "sources.default" }
}
