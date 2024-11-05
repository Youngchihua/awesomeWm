client.connect_signal('request::titlebar', function (c)

    require("ui.titlebar").normal(c)

end)


local sloppy_focus_enabled = true
local focus_delay = 0.5
local gears = require('gears')

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function (c)

    if sloppy_focus_enabled then
        gears.timer.start_new(focus_delay, function()
            if mouse.object_under_pointer() == c then
                c:activate({ context = "mouse_enter", raise = false })
            end
            return false
        end)
    end

end)