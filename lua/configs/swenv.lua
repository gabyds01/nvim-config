require('swenv').setup({
  -- Función personalizada para listar los entornos virtuales
  get_venvs = function(venv_folder)
    local api = require('swenv.api')
    -- Obtener entornos estándar del path centralizado
    local venvs = api.get_venvs(venv_folder) or {}

    -- Escanear la raíz del proyecto actual buscando entornos locales (.venv o env)
    local cwd = vim.fn.getcwd()
    
    local local_venv = cwd .. '/.venv'
    if vim.fn.isdirectory(local_venv) == 1 then
      table.insert(venvs, {
        name = '.venv (Local del Proyecto)',
        path = local_venv,
        source = 'local',
      })
    end
    
    local local_env = cwd .. '/env'
    if vim.fn.isdirectory(local_env) == 1 then
      table.insert(venvs, {
        name = 'env (Local del Proyecto)',
        path = local_env,
        source = 'local',
      })
    end

    return venvs
  end,
  -- Ruta por defecto para entornos virtuales centralizados
  venvs_path = vim.fn.expand('~/.virtualenvs'),
  -- Reiniciar automáticamente el servidor LSP (Pyright) al cambiar de entorno
  post_set_venv = function()
    -- Detener los clientes activos de pyright de forma nativa
    for _, client in ipairs(vim.lsp.get_clients({ name = 'pyright' })) do
      client.stop()
    end
    -- Recargar el buffer en diferido para levantar y vincular Pyright con el nuevo PATH
    vim.schedule(function()
      vim.cmd("edit")
    end)
  end,
})

-- Atajo de teclado: <Leader>vs para seleccionar entorno virtual en caliente
vim.keymap.set('n', '<leader>vs', function()
  require('swenv.api').pick_venv()
end, { desc = "Seleccionar entorno virtual de Python" })
