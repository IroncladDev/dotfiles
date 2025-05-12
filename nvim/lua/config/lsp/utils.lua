local opts = { noremap = true, silent = true }
local capabilities = require('blink.cmp').get_lsp_capabilities()
local keymap = vim.keymap
local buf = vim.lsp.buf

local on_attach = function(client, bufnr)
  opts.buffer = bufnr

  -- Essential Keymaps
  opts.desc = "LSP Hover"
  keymap.set("n", "K", buf.hover, opts)

  opts.desc = "LSP Rename"
  keymap.set("n", "<leader>ra", buf.rename, opts)

  opts.desc = "LSP Code actions"
  keymap.set("n", "<leader>ca", buf.code_action, opts)

  opts.desc = "LSP formatting"
  keymap.set("n", "<leader>fm", buf.format, opts)

  -- Go to
  opts.desc = "Go to definition"
  keymap.set("n", "gd", buf.definition, opts)

  opts.desc = "Go to implementation"
  keymap.set("n", "gi", buf.implementation, opts)

  opts.desc = "Open LSP references"
  keymap.set("n", "cr", buf.references, opts)

  opts.desc = "Go to LSP references"
  keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

  -- Diagnostics
  opts.desc = "Prev diagnostic"
  keymap.set("n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

  opts.desc = "Next diagnostic"
  keymap.set("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

  opts.desc = "Floating diagnostic"
  keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
end

return { 
  on_attach = on_attach, 
  capabilities = capabilities
}


