local utils = require('config.lsp.utils')

vim.lsp.config['ts_ls'] = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = {
    'tsconfig.json',
    'package.json',
  },
  init_options = {
    hostInfo = 'neovim',
  },
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
}

vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true)
  end,
})
