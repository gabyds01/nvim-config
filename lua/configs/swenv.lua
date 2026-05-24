require('swenv').setup({
  -- Función inteligente para detectar entornos virtuales locales y ascendentes
  get_venvs = function(venv_folder)
    local api = require('swenv.api')
    local venvs = api.get_venvs(venv_folder) or {}
    local added_paths = {}

    -- Registrar rutas ya existentes para evitar duplicados
    for _, v in ipairs(venvs) do
      local norm = v.path:gsub("/+$", "")
      added_paths[norm] = true
    end

    -- Función auxiliar para insertar entornos de forma segura y deduplicada
    local function add_venv(name, path, source)
      local norm_path = path:gsub("/+$", "")
      if not added_paths[norm_path] and vim.fn.isdirectory(norm_path) == 1 then
        table.insert(venvs, {
          name = name,
          path = norm_path,
          source = source,
        })
        added_paths[norm_path] = true
      end
    end

    -- 1. Buscar en el directorio de trabajo actual (raíz donde abriste Neovim)
    local cwd = vim.fn.getcwd()
    add_venv('.venv (Raíz del proyecto)', cwd .. '/.venv', 'local_cwd')
    add_venv('env (Raíz del proyecto)', cwd .. '/env', 'local_cwd')

    -- 2. Buscar hacia arriba desde el archivo actual (ideal para multiproyectos/monorepos)
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file and current_file ~= "" then
      local file_dir = vim.fs.dirname(current_file)

      -- Buscar .venv hacia arriba
      local venv_matches = vim.fs.find('.venv', {
        upward = true,
        path = file_dir,
        limit = 1,
        type = 'directory',
      })
      if #venv_matches > 0 then
        add_venv('.venv (Subproyecto de este archivo)', venv_matches[1], 'local_upward')
      end

      -- Buscar env hacia arriba
      local env_matches = vim.fs.find('env', {
        upward = true,
        path = file_dir,
        limit = 1,
        type = 'directory',
      })
      if #env_matches > 0 then
        add_venv('env (Subproyecto de este archivo)', env_matches[1], 'local_upward')
      end
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
