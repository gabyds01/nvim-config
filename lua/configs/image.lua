local status_ok, image = pcall(require, "image")
if not status_ok then
  return
end

image.setup({
  backend = "kitty", -- Default backend, will auto-detect Wezterm or fallback gracefully
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = true, -- Great for performance with multiple images
      filetypes = { "markdown", "vimwiki" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = true, -- Clear images when a floating window (like cmp) overlaps
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
})
