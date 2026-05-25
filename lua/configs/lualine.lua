local pomo_status = function()
  local ok, pomo = pcall(require, "pomo")
  if not ok then return "" end
  local timer = pomo.get_first_to_expire()
  if timer == nil then
    return ""
  end
  return "󰄉 " .. timer.name .. ": " .. timer:format_remaining()
end

require("lualine").setup {
  options = {
    theme = "auto"
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {{'filename', path = 4}},
    lualine_x = { pomo_status, "branch" },
    lualine_y = { "encoding" },
    lualine_z = { "location" }
  }
}

