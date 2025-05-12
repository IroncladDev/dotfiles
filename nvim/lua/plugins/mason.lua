return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  ensure_installed = {
    "stylua",
    "prettier"
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({ PATH = "append" })

    mason_lspconfig.setup({
      ensure_installed = {
        "astro",
        "biome",
        "lua_ls",
        "ts_ls",
        "rust_analyzer",
        "html",
        "cssls",
        "astro",
        "biome",
      },
      automatic_installation = true,
    })
  end,
}
