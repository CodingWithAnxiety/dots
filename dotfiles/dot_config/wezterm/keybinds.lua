-- Call WEZAPI --
local wezterm = require 'wezterm'
local act = wezterm.action

-- Call reload module --
local reload = require 'reload'


-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
  config.keys = {
    -- These are the SPLIT KEYBINDS! --
    {
      key = 'UpArrow',
      mods = 'CTRL|ALT',
      action = act.SplitPane {
        direction = 'Up',
        size = { Percent = 50 },
      },
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|ALT',
      action = act.SplitPane {
        direction = 'Down',
        size = { Percent = 50 },
      },
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|ALT',
      action = act.SplitPane {
        direction = 'Right',
        size = { Percent = 50 },
      },
    },
    {
      key = 'LeftArrow',
      mods = 'CTRL|ALT',
      action = act.SplitPane {
        direction = 'Left',
        size = { Percent = 50 },
      },
    },

    {
      key = 'q',
      mods = 'CTRL|ALT',
      action = act.CloseCurrentPane { confirm = true },
    },

    -- Keybinds to reload configs --

    {
      key = 'R',
      mods = 'CTRL|SHIFT|ALT',
      action = act.EmitEvent 'reload_kb',
    }
  }
end

-- return our module table
return module
