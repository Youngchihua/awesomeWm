local wibox   = require("wibox")
local helpers = require("ui.helpers")
local color   = require("themes.colorsheme")

local font      = "FiraCode Nerd Font Bold 13"

-- Option 1:  | 
-- Option 2:  | 
local show_icon = ""
local hide_icon = ""

-- 创建显示/隐藏图标的文本框部件
local icon = helpers.textbox(color.foreground, font, show_icon)
-- 创建带有边距的图标部件
local tray_toggle = helpers.margin(icon, 5, 5, 5, 5)
-- 创建带有边距的系统托盘部件
local systray = helpers.margin(
    { 
        base_size = 20,
        widget = wibox.widget.systray,
        opacity = 0.9,
        refresh_interval = 5
    },
    1, 1, 1, 1,
    false
)
-- 创建带有背景和形状的可切换系统托盘部件
local togglableSystray = helpers.cbackground({ systray, tray_toggle, layout = wibox.layout.fixed.horizontal }, helpers.rrect(4), color.crust)

-- 为图标部件添加点击事件
tray_toggle:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then
    -- 切换系统托盘的可见性
    systray.visible = not systray.visible
    -- 更新图标的显示
    if systray.visible then
      icon.markup = helpers.mtext(color.foreground, font, hide_icon)
    else
      icon.markup = helpers.mtext(color.foreground, font, show_icon)
    end
  end
end)

return togglableSystray
