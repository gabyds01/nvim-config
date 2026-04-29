-- Global config
vim.g.mapleader = ' '

-- Options config
vim.o.number = true
vim.o.relativenumber = true

-- for search
vim.o.ignorecase = true

-- for temp file if something wrong
vim.o.swapfile = false
vim.o.backup = false

vim.o.scrolloff = 4

require "plugins"
require "keymaps"
