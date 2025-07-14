require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- Enable relative line numbers
vim.wo.number = true -- Ensure absolute line numbers are enabled for the current line
vim.wo.relativenumber = true

vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:block-Cursor,r-cr-o:block-Cursor"
vim.opt.cursorline = true

vim.o.termguicolors = true -- Enable 24-bit RGB color support in the terminal

vim.opt.smoothscroll = true
