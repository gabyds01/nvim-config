require("lualine").setup {
  options = {
    theme = "auto"
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {{'filename', path = 4}},
    lualine_x = { "branch" },
    lualine_y = { "encoding" },
    lualine_z = { "location" }
  }
}
