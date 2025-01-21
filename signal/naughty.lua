local awful = require('awful')
local naughty = require('naughty')
local ruled = require('ruled')


ruled.notification.connect_signal('request::ruled', function ()

    ruled.notification.append_rule({
        rule = nil,
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5,
            max_height = 100,
            max_width = 300,
            opacity = 0.9
        }
    })
end)

naughty.connect_signal('request::display', function (n)
    require('ui.notification')(n)
end)