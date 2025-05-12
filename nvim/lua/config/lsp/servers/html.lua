local utils = require('config.lsp.utils')

vim.lsp.config['html'] = {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'xml', 'svg' },
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
}

vim.lsp.enable('html')

