local ts_parsers = {
  "lua",
  "python",
  "haskell",
  "markdown",
  "markdown_inline"
}

local nts = require("nvim-treesitter")
nts.install(ts_parsers)
