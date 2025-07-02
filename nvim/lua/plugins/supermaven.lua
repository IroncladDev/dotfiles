return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  config = function()
    local theme = require("catppuccin.palettes").get_palette("mocha")

    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-o>",
        accept_word = "<C-i>",
        clear_suggestion = "<C-y>"
      },
      disable_inline_completion = false,
      color = {
        suggestion_color = theme.overlay0,
        cterm = 244
      }
    })
  end,
}
