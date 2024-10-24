tag.connect_signal('require::default_layouts', function ()
    require('awful').layout.append_default_layouts(require('config.user').layouts)
end)