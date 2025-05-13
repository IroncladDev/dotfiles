local keymap = vim.keymap

-- Leader
vim.g.mapleader = " "

-- Nvimtree
keymap.set("n", "<leader>b", "<cmd> NvimTreeToggle <CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
keymap.set("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "Show diagnostics" })
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
keymap.set("n", "<leader>tc", "<cmd> Telescope commands <CR>", { desc = "Show commands" })
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })

-- Bufferline
keymap.set("n", "<tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next Tab" })
keymap.set("n", "<S-tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous Tab" })
keymap.set("n", "<leader>ox", "<cmd> BufferLineCloseOthers <CR>", { desc = "Close Others" })
keymap.set("n", "<leader>x", "<cmd> bp|bd # <CR>", { desc = "Close Buffer" })
keymap.set("n", "<leader>X", "<cmd> bd! <CR>", { desc = "Force Close Buffer" })

-- Navigating in Insert Mode
keymap.set("i", "<C-s>", "<ESC>^i", { desc = "Start of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Navigate in Normal Mode
keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Move up and down through wrapped lines in normal/terminal/visual mode
keymap.set(
  { "n", "v" },
  "j",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down", expr = true, noremap = true }
)
keymap.set(
  { "n", "v" },
  "k",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up", expr = true, noremap = true }
)

-- Move to the next/previous line if at the first/last column
keymap.set(
  { "n", "v" },
  "h",
  'v:count == 0 && col(".") == 1 ? "k$" : "h"',
  { desc = "Move left", expr = true, noremap = true }
)
keymap.set(
  { "n", "v" },
  "l",
  'v:count == 0 && col(".") == col("$") - 1 ? "j0" : "l"',
  { desc = "Move right", expr = true, noremap = true }
)

-- Additional movement
keymap.set({ "n", "v" }, "<C-h>", "^", { desc = "Start of line" })
keymap.set({ "n", "v" }, "<C-l>", "$", { desc = "End of line" })

-- Dioxus formatting
keymap.set("n", "<leader>fx", "<cmd> silent! !dx fmt <CR>", { desc = "Dioxus formatting" })

-- Redo
keymap.set("n", "<C-u>", "<C-r>", { desc = "Redo", noremap = true, silent = true })

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
keymap.set("n", "<leader>sh", ":vnew<CR> <C-w>h", { desc = "New split left" })
keymap.set("n", "<leader>sj", ":split<CR> <C-w>j", { desc = "New split down" })
keymap.set("n", "<leader>sk", ":new<CR> <C-w>k", { desc = "New split up" })
keymap.set("n", "<leader>sl", ":vsplit<CR> <C-w>l", { desc = "New split right" })

-- Parrot
keymap.set({ "n", "v" }, "<leader>ai", ":PrtChatToggle<CR>", { desc = "Parrot Toggle AI Chat" })
keymap.set({ "n", "v" }, "<leader>an", ":PrtChatNew<CR>", { desc = "Parrot New AI Chat" })
keymap.set({ "n", "v" }, "<leader>af", ":PrtChatFinder<CR>", { desc = "Parrot Find Chat" })
keymap.set({ "n", "v" }, "<leader>ar", ":PrtChatResponde<CR>", { desc = "Parrot Respond", silent = true })
keymap.set({ "n", "v" }, "<leader>as", ":PrtChatStop<CR>", { desc = "Parrot Stop Streaming" })
keymap.set({ "n", "v" }, "<leader>ad", ":PrtChatDelete<CR>", { desc = "Parrot Delete Chat" })
keymap.set({ "n", "v" }, "<leader>ap", ":PrtProvider<CR>", { desc = "Parrot Select Provider" })
keymap.set({ "n", "v" }, "<leader>am", ":PrtModel<CR>", { desc = "Parrot Select Model" })
keymap.set({ "v" }, "<leader>rw", ":PrtRewrite<CR>", { desc = "Rewrite" })

-- ToggleTerm
keymap.set({ "n", "v", "i", "t" }, "<C-f>", "<cmd> ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Folding
keymap.set("n", "<leader>zb", "$zf%", { desc = "Fold block" })
