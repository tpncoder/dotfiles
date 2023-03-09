local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local layouts = awful.widget.layoutbox {
  buttons = {
    awful.button {
      modifiers = {},
      button    = 1,
      on_press  = function() awful.layout.inc(1) end,
    },
    awful.button {
      modifiers = {},
      button    = 3,
      on_press  = function() awful.layout.inc( -1) end,
    },
    awful.button {
      modifiers = {},
      button    = 4,
      on_press  = function() awful.layout.inc( -1) end,
    },
    awful.button {
      modifiers = {},
      button    = 5,
      on_press  = function() awful.layout.inc(1) end,
    },
  }
}
local widget = {
  {
    {
      layouts,
      widget = wibox.container.margin
    },
    margins = 10,
    widget = wibox.container.margin
  },
  widget = wibox.container.background
}
return widget
