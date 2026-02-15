---@module "events.new-tab-button-modern"
---@author sravioli
---@license GNU-GPLv3

---@diagnostic disable-next-line: undefined-field
local wt = require "wezterm"

local M = {}

M.callback = function(window, pane, button, default_action)
  if default_action and button == "Left" then
    window:perform_action(default_action, pane)
  end

  if default_action and button == "Right" then
    window:perform_action(
      wt.action.ShowLauncherArgs { ---@diagnostic disable-line
        title = "  Select/Search:",
        flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS",
      },
      pane
    )
  end
  return false
end

return M
