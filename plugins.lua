vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/nvim-lualine/lualine.nvim",
})

require "configs.treesitter"
require "configs.lsp"
require "configs.lualine"
