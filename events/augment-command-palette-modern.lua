---@module "events.augment-command-palette-modern"
---@author sravioli
---@license GNU-GPLv3

---@diagnostic disable-next-line: undefined-field
local wt = require "wezterm"
local act = wt.action ---@diagnostic disable-line

local M = {}

M.callback = function(window, pane)
  return {
    {
      brief = "Rename tab",
      icon = "md_rename_box",
      action = act.PromptInputLine {
        description = "Enter new name for tab",
        action = wt.action_callback(function(inner_window, inner_pane, line) ---@diagnostic disable-line
          if line then
            inner_window:active_tab():set_title(line)
          end
        end),
      },
    },
  }
end

return M
