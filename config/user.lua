local awful = require('awful')


return {
  mod = 'Mod4',

  tags = { '1', '2', '3', '4', '5', '6', '7', '8', '9' },

  layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
  }
}

