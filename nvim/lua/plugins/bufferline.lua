return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        seperator_style = "padded_slant",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
        ,
      },

      highlights = require("catppuccin.groups.integrations.bufferline").get()
    })
  end,
}
