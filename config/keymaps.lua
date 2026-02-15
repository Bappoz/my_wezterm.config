-- ============================================================================
-- KEYMAPS: Atalhos de teclado customizados
-- ============================================================================

local wezterm = require 'wezterm'
local act = wezterm.action
local M = {}

---Aplica configurações de keymaps
---@param config table
function M.apply(config)
  config.keys = {
    -- ========================================================================
    -- SPLITS (Dividir painéis)
    -- ========================================================================
    -- Dividir Horizontalmente (Lado a Lado)
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    
    -- Dividir Verticalmente (Cima e Baixo)
    {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    
    -- Fechar painel atual
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = act.CloseCurrentPane { confirm = false },
    },

    -- ========================================================================
    -- NAVEGAÇÃO ENTRE PAINÉIS
    -- ========================================================================
    -- Mover para painel à esquerda
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Left',
    },
    
    -- Mover para painel à direita
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Right',
    },
    
    -- Mover para painel acima
    {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Up',
    },
    
    -- Mover para painel abaixo
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Down',
    },

    -- ========================================================================
    -- TABS
    -- ========================================================================
    -- Nova tab
    {
      key = 't',
      mods = 'CTRL|SHIFT',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    
    -- Fechar tab
    {
      key = 'w',
      mods = 'CTRL|ALT',
      action = act.CloseCurrentTab { confirm = false },
    },

    -- ========================================================================
    -- VISUAL
    -- ========================================================================
    -- Toggle fullscreen
    {
      key = 'f',
      mods = 'CTRL|SHIFT',
      action = act.ToggleFullScreen,
    },
    
    -- Quick Select (selecionar texto com hints)
    {
      key = 'Space',
      mods = 'CTRL|SHIFT',
      action = act.QuickSelect,
    },

    -- ========================================================================
    -- DEBUG
    -- ========================================================================
    -- Debug overlay
    {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = act.ShowDebugOverlay,
    },
  }
end

return M
