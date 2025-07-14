require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "jk", "<ESC>")

map("n", "<C-Up>", ":move .-2<CR>==", { desc = "Move line up" })
map("n", "<C-Down>", ":move .+1<CR>==", { desc = "Move line down" })

map("v", "<C-Up>", ":move '<,'>-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<C-Down>", ":move '<,'>+1<CR>gv=gv", { desc = "Move line down" })

map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to Next Error" })

map("n", "<leader>mp", ":MarkdownPreview <CR>", { desc = "Markdown Preview" })
map("n", "<leader>ms", ":MarkdownPreviewStop <CR>", { desc = "Markdown Preview Stop" })
map("n", "<leader>mt", ":MarkdownPreviewToggle <CR>", { desc = "Markdown Preview Toggle" })
