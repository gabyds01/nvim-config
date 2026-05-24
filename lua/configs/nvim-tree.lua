require("nvim-tree").setup({
  view = {
    adaptive_size = true,  
  },
  renderer = {
    icons = {
      show = {
	      file = false,
	      folder = false,
	      folder_arrow = true,
	      git = false,
      },
      glyphs = {
	      folder = {
	        arrow_closed = "›",
	        arrow_open = "⌃",
	      }
      }
    }
  }
})
