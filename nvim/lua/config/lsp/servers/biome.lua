local utils = require('config.lsp.utils')
local has_biome_json = vim.fn.filereadable(vim.fn.expand("biome.json")) == 1

if has_biome_json then
  vim.lsp.config['biome'] = {
    cmd = { 'biome', 'lsp-proxy' },
    settings = {
      linter = {
        enabled = true,
      },
    },
    on_attach = function(client, bufnr)
      utils.on_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
    end,
    capabilities = utils.capabilities,
  }

  vim.lsp.enable('biome')
end
