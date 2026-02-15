-- ============================================================================
-- FONTS: Configurações de fonte
-- ============================================================================

local wezterm = require 'wezterm'
local M = {}

---Aplica configurações de fonte
---@param config table
function M.apply(config)
  -- ============================================================================
  -- FONTE PRINCIPAL
  -- ============================================================================
  config.font = wezterm.font('JetBrainsMono Nerd Font', {
    weight = 'Regular',
  })
  
  config.font_size = 10.0
  config.line_height = 1.2
  
  -- Ajustes de renderização
  config.freetype_load_flags = 'NO_HINTING'
  config.freetype_load_target = 'Light'
end

-- ============================================================================
-- FONTES ALTERNATIVAS (descomente para usar)
-- ============================================================================
M.fonts = {
  jetbrains = 'JetBrainsMono Nerd Font',
  fira_code = 'FiraCode Nerd Font',
  cascadia = 'CaskaydiaCove Nerd Font',
  hack = 'Hack Nerd Font',
  meslo = 'MesloLGS Nerd Font',
  victor_mono = 'VictorMono Nerd Font',
  iosevka = 'Iosevka Nerd Font',
  monoid = 'Monoid Nerd Font',
}

return M
