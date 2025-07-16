return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Markdown preview plugin
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- image viewers : holo for markdown // image_preview for normal images // telescope_image_preview for telescope
	{
		"edluffy/hologram.nvim",
	},
	{
		"adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
	},

	-- git
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gedit", "Gsplit", "Gdiffsplit" },
		lazy = false,
	},

	-- php configuration
	{
		"jwalton512/vim-blade",
		ft = { "php", "blade.php" },
		config = function()
			vim.g.blade_custom_delimiters = { php = { "{{", "}}" } } -- Laravel-style syntax
		end,
	},

	-- python lsp configuration
	{
		"microsoft/pyright",
		ft = { "python" },
	},

	-- rust lsp configuration
	{
		"rust-lang/rust-analyzer",
		lazy = false,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
	-- {
	--   "mrcjkb/rustaceanvim",
	--   version = "^5", -- Recommended
	--   lazy = false, -- This plugin is already lazy
	-- },

	-- java lsp configuration
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"html",
				"css",
				"python",
				"rust",
				"java",
				"javascript",
				"typescript",
				"tsx",
				"dockerfile",
				"bash",
				"c",
				"cpp",
				"markdown",
			},
		},
	},
	-- lualine plugin for statusline
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = { theme = "auto" },
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
