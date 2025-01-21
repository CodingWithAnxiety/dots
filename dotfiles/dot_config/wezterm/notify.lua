--- A notification module for WezTerm using notify-send.
-- This module provides functionality to send notifications using the 'notify-send' command,
-- which is available on most Linux distributions that implement the org.freedesktop.Notifications specification.
-- @module notify
-- @author [Your Name]
-- @license [Your License]
-- @copyright [Your Copyright]

local wezterm = require 'wezterm'

local M = {}

--- Check if a value exists in a table.
-- @local
-- @param tab table The table to search
-- @param val any The value to search for
-- @return boolean True if the value is found, false otherwise
local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

--- Send a notification using 'notify-send'.
-- @param summary string The summary ('title') of the notification
-- @param body string|nil The body of the notification
-- @param expire number|nil The duration, in milliseconds, for the notification to appear on screen. Some implementations may ignore this.
-- @param options table|nil A table containing additional options. View notify-send manpage for more details.
-- @usage
-- local notify = require('notify')
-- notify.send("Hello", "World", 5000, {urgency = "normal"})
function M.send(summary, body, expire, options)
    -- Default values for optional fields
    options = options or {}

    -- Retrieve specific options from the 'options' table, or set to nil/default if not provided
    local app_name = options.app_name
    local category = options.category
    local icon = options.icon
    local urgency = options.urgency or "normal"   -- Default urgency is 'normal'
    local hint = options.hint

    -- Allowed urgency levels for validation
    local allowed_urgency = { "low", "normal", "critical" }
    -- If the provided urgency is not one of the allowed values, default to 'normal'
    if not has_value(allowed_urgency, urgency) then
        urgency = "normal"
    end

    -- Start building the command as a table of strings (to execute via wezterm)
    local cmd = { "notify-send", summary }

    -- Append the body if provided (body is optional)
    if body then
        table.insert(cmd, body)
    end

    -- Append the timeout if provided (timeout is optional)
    if expire then
        table.insert(cmd, "--expire-time")
        table.insert(cmd, tostring(expire)) -- Convert to string for command execution
    end

    -- Append optional arguments if provided, using the corresponding flag
    if app_name then
        table.insert(cmd, "--app-name")
        table.insert(cmd, app_name)
    end

    if category then
        table.insert(cmd, "--category")
        table.insert(cmd, category)
    end

    if icon then
        table.insert(cmd, "--icon")
        table.insert(cmd, icon)
    end

    if hint then
        table.insert(cmd, "--hint")
        table.insert(cmd, hint)
    end

    -- Always include the urgency flag with the validated urgency value
    table.insert(cmd, "--urgency")
    table.insert(cmd, urgency)

    -- Execute the command using wezterm's built-in child process runner
    wezterm.run_child_process(cmd)
end

return M