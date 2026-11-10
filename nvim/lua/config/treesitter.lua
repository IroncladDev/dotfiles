local javascript_fts = { "json", "javascript", "typescript", "typescriptreact", "javascriptreact" }
local xml_fts = { "html", "xml", "svg" }

vim.filetype.add({
	extension = {
		mdx = "markdown",
		sexp = "commonlisp",
		kbd = "commonlisp",
	},
})

vim.treesitter.language.register("tsx", javascript_fts)
vim.treesitter.language.register("html", xml_fts)
vim.treesitter.language.register("css", "css")
vim.treesitter.language.register("astro", "astro")
vim.treesitter.language.register("svelte", "svelte")
vim.treesitter.language.register("lua", "lua")
vim.treesitter.language.register("go", "go")
vim.treesitter.language.register("sql", "sql")
vim.treesitter.language.register("commonlisp", "commonlisp")

-- Build pattern array by concatenating all filetypes
local pattern = {}
vim.list_extend(pattern, javascript_fts)
vim.list_extend(pattern, xml_fts)
vim.list_extend(pattern, { "lua", "vim", "vimdoc", "css", "rust", "astro", "svelte", "go", "sql", "commonlisp" })

-- Enable treesitter highlighting and indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = pattern,
	callback = function()
		vim.treesitter.start()
	end,
})
