return {
    'pocco81/auto-save.nvim',
    trigger_events = { "InsertLeave", "TextChanged" },
    opts = {
        condition = function(buf)
            return vim.bo[buf].filetype ~= "oil"
        end
    }
}
