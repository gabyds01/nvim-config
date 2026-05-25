-- Configuración de nvim-notify
local notify = require("notify")
notify.setup({
  stages = "slide",
  timeout = 3000,
  background_colour = "#1f2335",
  render = "wrapped-compact",
})

vim.notify = notify

-- Configuración de pomo.nvim
require("pomo").setup({
  update_interval = 1000,
  
  -- Configurar la sesión Pomodoro nativa
  sessions = {
    rutina_diaria = {
      { name = "Trabajo", duration = "25m" },
      { name = "Descanso Corto", duration = "5m" },
      { name = "Trabajo", duration = "25m" },
      { name = "Descanso Corto", duration = "5m" },
      { name = "Trabajo", duration = "25m" },
      { name = "Descanso Largo", duration = "15m" },
    },
  },
  
  notifiers = {
    {
      name = "Default",
      opts = {
        -- true: Muestra un pop-up persistente con la cuenta regresiva.
        -- false: Solo notifica al inicio y al final (ideal si usas lualine).
        sticky = true, 
      },
    },
  },
})

-- Atajos de teclado simplificados
-- En lugar de 3 atajos, usas 1 para arrancar toda la sesión en cadena
vim.keymap.set("n", "<leader>ps", "<cmd>TimerSession rutina_diaria<cr>", { desc = "Iniciar Sesión Pomodoro Completa" })

-- Controles del temporizador
vim.keymap.set("n", "<leader>pe", "<cmd>TimerStop<cr>", { desc = "Detener Temporizador" })
vim.keymap.set("n", "<leader>pp", "<cmd>TimerPause<cr>", { desc = "Pausar Temporizador" })
vim.keymap.set("n", "<leader>pr", "<cmd>TimerResume<cr>", { desc = "Reanudar Temporizador" })

-- Opcional: Ocultar o mostrar el pop-up activo si te molesta en un momento dado
vim.keymap.set("n", "<leader>ph", "<cmd>TimerHide<cr>", { desc = "Ocultar UI del Temporizador" })
vim.keymap.set("n", "<leader>pu", "<cmd>TimerShow<cr>", { desc = "Mostrar UI del Temporizador" })