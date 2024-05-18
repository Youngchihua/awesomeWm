local awful = require("awful")
local ruled = require("ruled")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

local scratchpad = {}
scratchpad.client = nil
scratchpad.scratchpad_name = "scratchpad"
scratchpad.terminal = "st -t " .. scratchpad.scratchpad_name .. " -g 120x34"

function scratchpad.toggle()
    if scratchpad.client and scratchpad.client.valid then
        scratchpad.client.hidden = not scratchpad.client.hidden
        if not scratchpad.client.hidden then
            scratchpad.client:raise()
            scratchpad.client:emit_signal("request::activate", "scratchpad", {raise = true})
        end
    else
        awful.spawn(scratchpad.terminal, {
            floating = true,
            sticky = true,
            ontop = true,
            skip_taskbar = true,
            placement = awful.placement.centered
        })
    end
end

client.connect_signal("manage", function(c)
    if c.name == scratchpad.scratchpad_name then
        scratchpad.client = c
        c.floating = true
        c.width = 1200
        c.height = 600
        c:geometry({ x = (c.screen.geometry.width - c.width) / 2, y = (c.screen.geometry.height - c.height) / 2 })
        c.sticky = true
        c.ontop = true
        c.skip_taskbar = true
        c:raise()
    end
end)

return scratchpad
