local awful = require("awful")
local wibox = require("wibox")

local cpu_widget = require("ui.widgets.cpu-widget.cpu-widget")
local assault = require("ui.widgets.battery.assault")
local systray = require("ui.bar.systray")
local module = require(... .. '.module')
-- {{{ Wibar



return function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                module.taglist(s),
                s.mypromptbox,
            },
            module.tasklist(s), -- Middle widget
            {                   -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                systray,
                wibox.container.margin(cpu_widget({
                    width = 70,
                    step_width = 2,
                    step_spacing = 0,
                    color = '#434c5e'
                }), 4, 4),
                wibox.container.margin(assault({
                    battery = "BAT0", -- 获取数据的电池ID
                    adapter = "ADP0", -- 获取数据的交流适配器ID
                    height = 12.5,
                    critical_level = 0.15,
                    critical_color = "#ff0000",
                    charging_color = "#00ff00"
                }), 0, 4),
                wibox.widget.textclock(),
                module.layoutbox(s),
            },
        }
    }
end

-- }}}
