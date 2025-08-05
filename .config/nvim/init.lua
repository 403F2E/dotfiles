vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- require("hologram").setup {
--   auto_display = true,
-- }

require("flutter-tools").setup({})

require("image_preview").setup({})

local tele = require("telescope")
tele.load_extension("flutter")
tele.load_extension("media_files")
tele.setup({
	extensions = {
		media_files = {
			-- filetypes whitelist
			filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
			-- find command (defaults to `fd`)
			find_cmd = "find",
		},
	},
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)
