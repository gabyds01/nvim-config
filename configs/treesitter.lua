local ts_parsers = {
  "lua",
  "python",
}

local nts = require("nvim-treesitter")
nts.install(ts_parsers)
