vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/karb94/neoscroll.nvim",
  "https://codeberg.org/andyg/leap.nvim",
})

require "configs.treesitter"
require "configs.lsp"
require "configs.lualine"
require "configs.nvim-tree"
require "configs.neoscroll"
require "configs.leap"

