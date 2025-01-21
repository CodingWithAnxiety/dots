-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Pull in additional keybinds and requirements
local keybinds = require 'keybinds'

local notify = require("notify") -- Assuming 'notify.lua' is in your Lua path


-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'rose-pine'

config.default_cursor_style = 'BlinkingBar'

config.animation_fps = 60

config.colors = {

	selection_bg = '#fffacd',

	selection_fg = 'black',
}

config.window_background_opacity = 0.75

keybinds.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
