local utils = require('config.lsp.utils')

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json', '.luarc.jsonc', '.luacheckrc',
    '.stylua.toml', 'stylua.toml', 'selene.toml',
    'selene.yml', 'lazy-lock.json', 'init.lua',
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath('config'),
        },
      },
      telemetry = { enable = false },
    },
  },
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
}

vim.lsp.enable('lua_ls')
