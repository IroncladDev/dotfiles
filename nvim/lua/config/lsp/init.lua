require('config.lsp.servers.ts_ls')
require('config.lsp.servers.lua_ls')
require('config.lsp.servers.html')
require('config.lsp.servers.cssls')
require('config.lsp.servers.biome')
require('config.lsp.servers.astro')
require('config.lsp.servers.rust_analyzer')

vim.api.nvim_create_user_command('LspRestart', function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.cmd('edit') -- This reloads the buffer and reconnects LSP
end, {})

