vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/karb94/neoscroll.nvim",
  "https://codeberg.org/andyg/leap.nvim",
  "https://github.com/junegunn/fzf",
  "https://github.com/junegunn/fzf.vim",
  "https://github.com/sbdchd/neoformat",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/AckslD/swenv.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/akinsho/toggleterm.nvim",
  "https://github.com/christoomey/vim-tmux-navigator",
})

require "configs.treesitter"
require "configs.lsp"
require "configs.lualine"
require "configs.nvim-tree"
require "configs.neoscroll"
require "configs.leap"
require "configs.fzf"
require "configs.neoformat"
require "configs.tokyo"
require "configs.gitsigns"
require "configs.swenv"
require "configs.autopairs"
require "configs.comment"
require "configs.which-key"
require "configs.bufferline"
require "configs.surround"
require "configs.toggleterm"
