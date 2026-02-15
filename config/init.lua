-- ============================================================================
-- CONFIG MODULE LOADER
-- ============================================================================
-- Carrega todos os módulos de configuração
-- ============================================================================

local M = {}

---Aplica todas as configurações modulares
---@param config table WezTerm configuration object
function M.apply(config)
  -- Carregar módulos de configuração
  local appearance = require 'config.appearance'
  local fonts = require 'config.fonts'
  local shell = require 'config.shell'
  local tabs = require 'config.tabs'
  local keymaps = require 'config.keymaps'
  
  -- Aplicar configurações na ordem correta
  appearance.apply(config)
  fonts.apply(config)
  shell.apply(config)
  tabs.apply(config)
  keymaps.apply(config)
end

return M
