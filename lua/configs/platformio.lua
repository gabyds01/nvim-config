local status_ok, platformio = pcall(require, "platformio")
if not status_ok then
  return
end

platformio.setup({
  lsp = 'clangd',               -- Use clangd as the language server (recommended & active in this setup)
  clangd_source = 'compiledb',  -- Generate compile_commands.json for clangd to read
  picker_backend = 'ui_select', -- Falls back to Neovim's standard vim.ui.select picker backend
  menu_key = '<leader>p',       -- Intuitive keybinding to toggle the PlatformIO menu (Space + p)
})
