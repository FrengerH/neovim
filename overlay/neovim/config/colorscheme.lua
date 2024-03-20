-- local colorscheme = "tokyonight-night"
-- local colorscheme = "dracula"
local colorscheme = "catppuccin"

if colorscheme == "catppuccin" then
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
    })
end


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
