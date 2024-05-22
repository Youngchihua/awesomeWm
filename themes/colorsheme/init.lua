local theme = "catppuccin_mocha"
local colorscheme

local colorschemes = {
  catppuccin_mocha = require("themes.colorsheme.catppuccin_mocha")
}

if theme == "catppuccin_mocha" then
  colorscheme = colorschemes.catppuccin_mocha
end

return colorscheme
