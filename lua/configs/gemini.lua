require('gemini').setup({
  model_config = {
    model_id = 'gemini-3.5-flash', -- Gemini 3.5 Flash (Medium Thinking Effort por defecto)
    temperature = 0.2,
    top_k = 40,
  },
  chat_config = {
    enabled = true,
  },
  hints = {
    enabled = true,
    hints_delay = 2000,
    insert_result_key = '<S-Tab>', -- Shift+Tab para insertar la sugerencia sugerida en modo Insertar
  },
  completion = {
    enabled = true,
    completion_delay = 800,
    insert_result_key = '<S-Tab>',
    blacklist_filetypes = { 'help', 'qf', 'json', 'yaml', 'toml', 'xml' },
  },
})
