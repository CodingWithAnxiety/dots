-- Pull WEZAPI
local wezterm = require 'wezterm'
local notify = require('notify')
local act = wezterm.action

wezterm.on('reload_kb', function(window, pane)
    wezterm.reload_configuration()
    notify.send("Config reloaded!", "Configuration has been reloaded.", 5000, {
      urgency = "normal",
      category = "device",
      expire = 5000,
      app_name = "Wezterm",
      hint = "string:desktop-entry:org.wezfurlong.wezterm"
  })

end)
