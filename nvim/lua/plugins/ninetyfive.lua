return {
	"numerataz/ninetyfive.nvim",
	version = "*",
	config = function()
		require("ninetyfive").setup({
			enable_on_startup = true,
			mappings = {
				accept = "<C-d>",
				accept_line = "<C-g>",
				accept_word = "<C-s>",
				reject = "<C-y>",
			},
			indexing = {
				mode = "on",
				cache_consent = true,
			},
		})
	end,
}
