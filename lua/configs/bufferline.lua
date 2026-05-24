require("bufferline").setup({
  options = {
    mode = "buffers",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp", -- Muestra indicadores de error/warning del LSP en las pestañas
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorador de Archivos",
        text_align = "left",
        separator = true
      }
    }
  }
})

-- Mapeos para navegar entre pestañas como un navegador
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Siguiente pestaña" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Pestaña anterior" })
