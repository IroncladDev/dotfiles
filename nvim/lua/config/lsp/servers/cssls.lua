local utils = require('config.lsp.utils')

vim.lsp.config['cssls'] = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css' },
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
}

vim.lsp.enable('cssls')
