require("which-key").setup({
  preset = "classic", -- preset estilo clásico para v3+
  delay = function(ctx)
    return ctx.keys:sub(1, 1) == "<Space>" and 0 or 200
  end,
})
