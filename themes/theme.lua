-- NOTE: https://awesomewm.org/apidoc/documentation/06-appearance.md.html
local gears         = require("gears")
local color         = require("themes.colorsheme")
local layout_path   = os.getenv("HOME") .. "/.config/awesome/assets/icons/layouts/"
local titlebar_path = os.getenv("HOME") .. "/.config/awesome/assets/icons/titlebar/"

local theme = {}

-------------------------------------------------------------------------------
-- Default variables
-------------------------------------------------------------------------------
theme.useless_gap                       = 0
theme.font                              = "sans 9"

theme.bg_normal                         = color.background
theme.bg_focus                          = color.background
theme.bg_urgent                         = color.background
theme.bg_minimize                       = color.background

theme.fg_normal                         = color.foreground
theme.fg_focus                          = color.foreground
theme.fg_urgent                         = color.red
theme.fg_minimize                       = color.foreground

theme.border_width                      = 1
theme.border_color_active               = color.blue
theme.border_color_normal               = color.background

theme.bg_systray                        = color.background

-------------------------------------------------------------------------------
-- hotkeys
-------------------------------------------------------------------------------
theme.hotkeys_border_color              = color.blue
theme.hotkeys_modifiers_fg              = color.foreground
theme.hotkeys_font                      = "JetBrainsMono Nerd Font Mono 10"
theme.hotkeys_description_font          = "JetBrainsMono Nerd Font Mono 10"
theme.hotkeys_group_margin              = 10

-------------------------------------------------------------------------------
-- taglist
-------------------------------------------------------------------------------
theme.taglist_font                      = "FiraCode Nerd Font Bold 12"
theme.taglist_bg_focus                  = color.crust
theme.taglist_fg_focus                  = color.blue
theme.taglist_fg_occupied               = color.text
theme.taglist_fg_empty                  = color.surface0
theme.taglist_fg_urgent                 = color.red
theme.taglist_spacing                   = 1

-------------------------------------------------------------------------------
-- tasklist
-------------------------------------------------------------------------------
theme.tasklist_disable_icon             = false


theme.wallpaper = "/home/Hua/Downloads/wallpaper/wallhaven-qzmlj5_1920x1080.png"

-------------------------------------------------------------------------------
-- layout
-------------------------------------------------------------------------------
theme.layout_fairh                      = layout_path .. "fairhw.png"
theme.layout_fairv                      = layout_path .. "fairvw.png"
theme.layout_floating                   = layout_path .. "floatingw.png"
theme.layout_magnifier                  = layout_path .. "magnifierw.png"
theme.layout_max                        = layout_path .. "maxw.png"
theme.layout_fullscreen                 = layout_path .. "fullscreenw.png"
theme.layout_tilebottom                 = layout_path .. "tilebottomw.png"
theme.layout_tileleft                   = layout_path .. "tileleftw.png"
theme.layout_tile                       = layout_path .. "tilew.png"
theme.layout_tiletop                    = layout_path .. "tiletopw.png"
theme.layout_spiral                     = layout_path .. "spiralw.png"
theme.layout_dwindle                    = layout_path .. "dwindlew.png"
theme.layout_cornernw                   = layout_path .. "cornernww.png"
theme.layout_cornerne                   = layout_path .. "cornernew.png"
theme.layout_cornersw                   = layout_path .. "cornersww.png"
theme.layout_cornerse                   = layout_path .. "cornersew.png"

-------------------------------------------------------------------------------
-- titlebar
-------------------------------------------------------------------------------
theme.titlebar_bg                       = color.background
theme.titlebar_bg_focus                 = color.background
-- Close Button
theme.titlebar_close_button_normal      = gears.color.recolor_image(titlebar_path .. "button.png", "#7f849c")
theme.titlebar_close_button_focus       = gears.color.recolor_image(titlebar_path .. "button.png", color.red)
theme.titlebar_close_button_focus_hover = titlebar_path .. "button_close.png"

-------------------------------------------------------------------------------
-- systray
-------------------------------------------------------------------------------
theme.bg_systray = color.base
theme.systray_max_rows = nil
theme.systray_icon_spacing = 3

return theme
