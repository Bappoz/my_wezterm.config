-- ============================================================================
-- WezTerm Configuration - Modular Setup
-- ============================================================================
-- Configuração modular do WezTerm
-- 
-- ESTRUTURA:
--   config/       - Módulos de configuração (appearance, fonts, keymaps, etc)
--   events/       - Event handlers (tabs, status bar, etc)
--   assets/       - Recursos estáticos
-- 
-- CARACTERÍSTICAS:
--   ✨ Fish shell no WSL Ubuntu
--   🎨 Tema Catppuccin Macchiato (facilmente alterável)
--   🔤 Fonte JetBrains Mono Nerd Font
--   📑 Tabs estilizadas com ícones
--   ⌨️  Atalhos customizados
-- 
-- COMO USAR:
--   1. Clone o repositório
--   2. Ajuste configurações em config/* conforme necessário
--   3. Reinicie o WezTerm
-- 
-- ATALHOS PRINCIPAIS:
--   Ctrl+Shift+V     - Split horizontal (lado a lado)
--   Ctrl+Shift+H     - Split vertical (cima e baixo)
--   Ctrl+Shift+W     - Fechar painel
--   Ctrl+Shift+T     - Nova tab
--   Ctrl+Shift+F     - Fullscreen
--   Ctrl+Shift+Setas - Navegar entre painéis
--   Ctrl+Shift+P     - Paleta de comandos
--   Ctrl+Shift+L     - Debug overlay
-- ============================================================================

local wezterm = require 'wezterm'

-- Usar config_builder se disponível (WezTerm >= 20230320)
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- ============================================================================
-- SETUP DO PATH DE MÓDULOS
-- ============================================================================
local config_path = wezterm.home_dir .. '/.config/wezterm'
package.path = package.path .. ';' .. config_path .. '/?.lua'
package.path = package.path .. ';' .. config_path .. '/?/init.lua'

-- ============================================================================
-- CARREGAR CONFIGURAÇÕES MODULARES
-- ============================================================================
pcall(function()
  local config_module = require 'config'
  config_module.apply(config)
end)

-- ============================================================================
-- CARREGAR EVENT HANDLERS
-- ============================================================================
pcall(function()
  local events = require 'events'
  if events.setup then
    events.setup(config)
  end
end)

return config
