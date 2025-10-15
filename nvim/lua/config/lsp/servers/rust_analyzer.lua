local utils = require('config.lsp.utils')

vim.lsp.config['rust_analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = {
        'Cargo.toml',
    },
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = true,
            inlayHints = {
                enable = false,
            },
            diagnostics = {
                enable = true,
            },
            cargo = {
                allFeatures = true,
            },
            completion = true,
            assist = true,
        }
    }
}

vim.lsp.enable('rust_analyzer')
