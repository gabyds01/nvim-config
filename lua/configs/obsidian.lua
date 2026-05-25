require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/vault",
    },
  },
  completion = {
    nvim_cmp = true, -- Integración directa con nvim-cmp para autocompletar [[nota]] y #tag
    min_chars = 2,
  },
  picker = {
    name = "fzf-lua",
  },
  -- Configuración de atajos integrada en el plugin
  mappings = {
    -- Ir al link de Obsidian bajo el cursor
    ["gd"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true, desc = "Ir al enlace de Obsidian" },
    },
    -- Alternar checkbox (tarea pendiente/completada)
    ["<leader>ch"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true, desc = "Alternar Checkbox" },
    },
  },
  -- Configurar de dónde sacar los IDs de notas nuevos
  note_id_func = function(title)
    -- Generar IDs limpios en minúsculas y separados por guiones
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90)):lower()
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,
})

-- Atajos globales para Obsidian (con prefijo <leader>o)
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Nueva nota de Obsidian" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Buscar notas en el Vault" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Nota del día de hoy" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Abrir nota en la App de Obsidian" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Ver enlaces entrantes (Backlinks)" })
