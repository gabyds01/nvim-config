require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]], -- Ctrl+\ para abrir y cerrar la terminal flotante
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float", -- Terminal flotante en el centro de la pantalla
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "rounded",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
})

-- Mapeos inteligentes dentro de la terminal para moverse con total fluidez
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- Presionar Esc o jk dentro de la terminal pasa a modo Normal para poder scrollar el historial
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

-- Vincular los atajos dinámicos sólo cuando se inicie la terminal
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
