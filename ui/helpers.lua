local wibox = require("wibox")
local gears = require("gears")
local dpi   = require("beautiful").xresources.apply_dpi

local helpers = {}

-- 创建带有颜色和字体的文本字符串
helpers.mtext = function(color, font, text)
  return '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>'
end

-- 创建带有颜色和字体的文本框部件
helpers.textbox = function(color, font, text)
  return wibox.widget {
    markup = '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>',
    widget = wibox.widget.textbox
  }
end

-- 创建带有边距的部件
helpers.margin = function(wgt, ml, mr, mt, mb, visible)
  return wibox.widget {
    wgt,
    widget = wibox.container.margin,
    left = dpi(ml),
    right = dpi(mr),
    top = dpi(mt),
    bottom = dpi(mb),
    visible = visible
  }
end

-- 创建带有圆角的矩形形状
helpers.rrect = function(radius)
  radius = radius or dpi(4)
  return function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
  end
end

-- 创建带有背景和形状的部件
helpers.cbackground = function(widget, shape, bg)
  return wibox.widget {
    widget,
    shape = shape,
    bg = bg,
    widget = wibox.container.background
  }
end

-- 重新着色图像
helpers.gcolor_recolorimg = function (image, color)
  return gears.color.recolor_image(image, color)
end

return helpers
