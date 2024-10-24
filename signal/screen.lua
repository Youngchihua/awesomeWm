local awful     = require('awful')
local beautiful = require('beautiful')
local wibox     = require('wibox')


--- Attach tags and widgets to all screens.
screen.connect_signal('request::desktop_decoration', function(s)
    -- Create all tags and attach the layouts to each of them.
    awful.tag(require('config.user').tags, s, awful.layout.layouts[1])
    -- Attach a wibar to each screen.
    s.bar = require('ui.wibar')(s)
 end)

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)
-- }}}