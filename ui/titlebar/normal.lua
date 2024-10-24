local awful = require('awful')
local wibox = require('wibox')

return function (c)
    
    local buttons = {
        awful.buttons(nil, 1, function ()
            c:activate({context = 'titlebar', action = 'mouse_move'})
        end),
        awful.buttons(nil, 3, function ()
            c:activate({context = 'titlebar', action = 'mouse_resize'})
        end)
    }

    awful.titlebar(c).wibox = wibox({
        layout = wibox.layout.horizontal,
        {
            layout = wibox.layout.horizontal,
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons
        },
        {
            layout = wibox.layout.flex.horizontal,
            {
                widget = awful.titlebar.widget.titlewidget(c),
                halign = 'center'
            },
            buttons = buttons
        },
        {
            layout = wibox.layout.fixed.horizontal,
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c)
        }
    })
    
end