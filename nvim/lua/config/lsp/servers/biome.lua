local utils = require('config.lsp.utils')

vim.lsp.config['biome'] = {
  cmd = { 'biome', 'lsp-proxy' },
  root_markers = {
    'biome.json'
  },
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
