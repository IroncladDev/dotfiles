local utils = require('config.lsp.utils')

vim.lsp.config['astro'] = {
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  root_markers = {
    'tsconfig.json',
    'package.json',
    'astro.config.mjs',
  },
  init_options = {
    typescript = {
      tsdk = vim.fn.resolve(
        vim.fn.stdpath("data")
        .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
      ),
    },
  },
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
}

vim.lsp.enable('astro')
