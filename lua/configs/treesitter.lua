local ts_parsers = {
  "lua",
  "python",
  "haskell"
}

local nts = require("nvim-treesitter")
nts.install(ts_parsers)
