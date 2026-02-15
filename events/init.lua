---@module "events.init"
---@author sravioli
---@license GNU-GPLv3

local wezterm = require 'wezterm'

local M = {}

---Setup all event handlers for WezTerm
---@param config table WezTerm configuration object
function M.setup(config)
  -- Registrar eventos com proteção individual contra erros
  
  -- 1. Format tab title (essencial)
  pcall(function()
    local format_tab_title = require "events.format-tab-title-modern"
    wezterm.on('format-tab-title', format_tab_title.callback) ---@diagnostic disable-line
  end)
  
  -- 2. New tab button (útil)
  pcall(function()
    local new_tab_button = require "events.new-tab-button-modern"
    wezterm.on('new-tab-button-click', new_tab_button.callback) ---@diagnostic disable-line
  end)
  
  -- 3. Augment command palette (extra)
  pcall(function()
    local augment_command_palette = require "events.augment-command-palette-modern"
    wezterm.on('augment-command-palette', augment_command_palette.callback) ---@diagnostic disable-line
  end)
  
  -- 4. Update status (visual, pode ser ativado)
  pcall(function()
    local update_status = require "events.update-status-modern"
    wezterm.on('update-status', update_status.callback) ---@diagnostic disable-line
  end)
end

return M
