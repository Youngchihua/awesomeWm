-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
-- Notification library
local naughty = require("naughty")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message = message
  }
end)
-- }}}

-- Allow Awesome to automatically focus a client upon changing tags or loading.
require('awful.autofocus')
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
require("themes")

-- -- {{{ Tag layout
-- require("layouts")
-- -- }}}



-- {{{ Wibar
-- require("wibar")
-- }}}

-- {{{ Mouse bindings

-- }}}

-- {{{ Key bindings
require("binds")
-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
require("config.rules")
-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
require("signal")
-- }}}



-- 启用低内存消耗设置
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
  timeout = 5,
  autostart = true,
  call_now = true,
  callback = function()
    collectgarbage("collect")
  end,
})

