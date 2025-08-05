require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files follow=true  no_ignore=true hidden=true<cr>",
	{ desc = "telescope find files" }
)
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true cwd=~/ no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

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

-- Gitsigns keybindings
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame current line" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })

-- Fugitive keybindings
map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
map("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git diff" })
map("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
map("n", "<leader>gbb", ":Git blame<CR>", { desc = "Git blame" })
map("n", "<leader>gP", ":Git push<CR>", { desc = "Git push" })
map("n", "<leader>gA", ":Git add .<CR>", { desc = "Git add all files" })

-- flutter keybindings
map("n", "<leader>tf", ":Telescope flutter commands<CR>", { desc = "Display the flutter commands" })
