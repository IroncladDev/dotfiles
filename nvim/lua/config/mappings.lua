local keymap = vim.keymap

local left = "n"
local down = "e"
local up = "i"
local right = "o"

vim.keymap.set({ 'i', 't', 'c' }, '<M-BS>', '<C-w>', { noremap = true })

-- Move up and down through wrapped lines in normal/terminal/visual mode
keymap.set(
    { "n", "v" },
    down,
    'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
    { expr = true, noremap = true }
)
keymap.set(
    { "n", "v" },
    up,
    'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
    { expr = true, noremap = true }
)

-- Move to the next/previous line if at the first/last column
keymap.set(
    { "n", "v" },
    left,
    'v:count == 0 && col(".") == 1 ? "k$" : "h"',
    { expr = true, noremap = true }
)
keymap.set(
    { "n", "v" },
    right,
    'v:count == 0 && col(".") == col("$") - 1 ? "j0" : "l"',
    { expr = true, noremap = true }
)

keymap.set({ 'n', 'v' }, 'k', 'n', { noremap = true })
keymap.set({ 'n', 'v' }, "j", 'e', { noremap = true })
keymap.set({ 'n', 'v' }, 'h', 'o', { noremap = true })
keymap.set({ 'n', 'v' }, 'l', 'i', { noremap = true })

keymap.set({ 'n', 'v' }, "K", "N", { noremap = true })
keymap.set({ 'n', 'v' }, 'H', 'O', { noremap = true })

-- Leader
vim.g.mapleader = " "

-- Nvimtree
keymap.set("n", "<leader>b", "<cmd> Oil <CR>")

-- Telescope
-- keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
keymap.set("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "Show diagnostics" })
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>fc", "<cmd> Telescope commands <CR>", { desc = "Show commands" })
keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })

-- FFF
keymap.set("n", "<leader>ff", function()
    require("fff").find_files()
end, { desc = "Find files" })
-- keymap.set("n", "<leader>fg", function()
--     require("fff").find_in_git_root()
-- end, { desc = "Git status" })

-- Bufferline
keymap.set("n", "<tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next Tab" })
keymap.set("n", "<S-tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous Tab" })
keymap.set("n", "<leader>ox", "<cmd> BufferLineCloseOthers <CR>", { desc = "Closqe Others" })
keymap.set("n", "<leader>x", "<cmd> bp|bd # <CR>", { desc = "Close Buffer" })
keymap.set("n", "<leader>X", "<cmd> bd! <CR>", { desc = "Force Close Buffer" })

-- Navigating in Insert Mode
keymap.set("i", "<C-" .. left .. ">", "<Left>", { desc = "Move left", noremap = true })
keymap.set("i", "<C-" .. down .. ">", "<Down>", { desc = "Move down", noremap = true })
keymap.set("i", "<C-" .. up .. ">", "<Up>", { desc = "Move up", noremap = true })
keymap.set("i", "<C-" .. right .. ">", "<Right>", { desc = "Move right", noremap = true })

-- Navigate in Normal Mode
keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Visual Navigation
keymap.set("v", "<", "<gv", { desc = "Indent line" })
keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Paste in terminal mode
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Toggle comment in both modes
keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
keymap.set(
    "v",
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Toggle comment" }
)

-- Terminal Mode
keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true })

-- Splits
keymap.set("n", "<leader>s" .. left, ":vnew<CR> <C-w>h", { desc = "New split left" })
keymap.set("n", "<leader>s" .. down, ":split<CR> <C-w>j", { desc = "New split down" })
keymap.set("n", "<leader>s" .. up, ":new<CR> <C-w>k", { desc = "New split up" })
keymap.set("n", "<leader>s" .. right, ":vsplit<CR> <C-w>l", { desc = "New split right" })

-- Window navigation
keymap.set("n", "<leader>w" .. left, "<C-w>h", { desc = "Move left" })
keymap.set("n", "<leader>w" .. down, "<C-w>j", { desc = "Move down" })
keymap.set("n", "<leader>w" .. up, "<C-w>k", { desc = "Move up" })
keymap.set("n", "<leader>w" .. right, "<C-w>l", { desc = "Move right" })

-- Parrot
keymap.set({ "n", "v" }, "<leader>ai", ":PrtChatToggle<CR>", { desc = "Parrot Toggle AI Chat" })
keymap.set({ "n", "v" }, "<leader>an", ":PrtChatNew<CR>", { desc = "Parrot New AI Chat" })
keymap.set({ "n", "v" }, "<leader>af", ":PrtChatFinder<CR>", { desc = "Parrot Find Chat" })
keymap.set({ "n", "v" }, "<leader>ar", ":PrtChatResponde<CR>", { desc = "Parrot Respond", silent = true })
keymap.set({ "n", "v" }, "<leader>as", ":PrtChatStop<CR>", { desc = "Parrot Stop Streaming" })
keymap.set({ "n", "v" }, "<leader>ap", ":PrtProvider<CR>", { desc = "Parrot Select Provider" })
keymap.set({ "n", "v" }, "<leader>am", ":PrtModel<CR>", { desc = "Parrot Select Model" })
keymap.set({ "v" }, "<leader>rw", ":PrtRewrite<CR>", { desc = "Rewrite" })

-- ToggleTerm
keymap.set({ "n", "v", "t" }, "<C-f>", "<cmd> ToggleTerm<CR>", { desc = "Toggle Terminal" })
