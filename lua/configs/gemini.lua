require('gemini').setup({
  model_config = {
    model_id = 'gemini-3.5-flash', -- Gemini 3.5 Flash (Medium Thinking Effort)
    temperature = 0.2,
    top_k = 40,
  },
  chat_config = {
    enabled = true,
    model = {
      model_id = 'gemini-3.5-flash',
      temperature = 0.3, -- Mayor temperatura para respuestas de chat más conversacionales
      top_k = 40,
    },
    window = {
      position = "right", -- Abrir chat en un split a la derecha para ver tu código en simultáneo
      width = 45,
    }
  },
  instruction = {
    model = {
      model_id = 'gemini-3.5-flash',
      temperature = 0.1, -- Baja temperatura para máxima precisión en explicaciones, test y review
      top_k = 40,
    },
    menu_key = '<Leader><Leader><Leader>g',
  },
  completion = {
    enabled = true,
    completion_delay = 800,
    insert_result_key = '<S-Tab>',
    blacklist_filetypes = { 'help', 'qf', 'json', 'yaml', 'toml', 'xml', 'ini' },
    model = {
      model_id = 'gemini-3.5-flash',
      temperature = 0.1, -- Muy baja temperatura para autocompletados de código exactos
      top_k = 40,
    }
  },
  task = {
    model = {
      model_id = 'gemini-3.5-flash',
      temperature = 0.1, -- Alta precisión para generación y parcheo de código
      top_k = 40,
    }
  }
})

-- Mapeos inteligentes para atajos de Inteligencia Artificial (Prefijo <leader>a)
-- Compatibles con modo Normal (n) y Visual (v) para operar sobre el código seleccionado

-- 1. Chat interactivo en split lateral
vim.keymap.set('n', '<leader>ac', ':GeminiChat ', { desc = "Gemini Chat (Escribe consulta)" })

-- 2. Tarea AI (Escribe qué quieres cambiar, abre un diff y luego aplica)
vim.keymap.set('n', '<leader>at', ':GeminiTask ', { desc = "Gemini Task (Modificar/Crear código)" })
vim.keymap.set('n', '<leader>aa', '<cmd>GeminiApply<cr>', { desc = "Aplicar cambios de Gemini" })

-- 3. Explicación de Código (Normal/Visual)
vim.keymap.set({'n', 'v'}, '<leader>ae', ':GeminiCodeExplain<cr>', { desc = "Explicar código" })

-- 4. Revisión de Código (Normal/Visual)
vim.keymap.set({'n', 'v'}, '<leader>ar', ':GeminiCodeReview<cr>', { desc = "Revisar código (Code Review)" })

-- 5. Generación de Pruebas Unitarias (Normal/Visual)
vim.keymap.set({'n', 'v'}, '<leader>au', ':GeminiUnitTest<cr>', { desc = "Generar Pruebas Unitarias" })
