local awful = require('awful')
local ruled = require('ruled')


-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = false,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false,
            maximized = false,
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer",
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false      }
    }

    ruled.client.append_rule {
        -- 微信设置在其他窗口对焦后会消失
        rule       = { class = "wechat" },
        properties = {
            floating = true,            -- 设置 WeChat 为浮动窗口
            -- width    = 800,             -- 可选：设置初始宽度
            -- height   = 600,             -- 可选：设置初始高度
            tag      = "8",             -- 可选：分配到特定标签
            focus    = false,            -- 打开时自动聚焦
            skip_taskbar = false,        -- 不显示在任务栏
            sticky = false,              -- 使窗口始终可见于所有标签
            border_width = 0, -- 移除窗口边框
        }
    }

    ruled.client.append_rule {
        rule       = { class = "QQ" },
        properties = {
            floating = true,            
            tag      = "9",             -- 可选：分配到特定标签
            border_width = 0, -- 移除窗口边框
            placement = awful.placement.centered  -- 居中窗口
        }
    }
    

    -- ruled.client.append_rule {
    --     rule       = {name= "scratchpad"},
    --     properties = {
    --         floating = true,
    --         width    = 1200,
    --         height    = 600,
    --         x = (screen[1].geometry.width - 1200) / 2, 
    --         y = (screen[1].geometry.height - 600) / 2, 
    --         sticky = true, -- 使窗口始终可见
    --         skip_taskbar = true -- 不显示在任务栏
    --     }
    -- }
    
    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)
-- }}}
