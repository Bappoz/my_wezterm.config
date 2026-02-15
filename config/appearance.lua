-- ============================================================================
-- APPEARANCE: Temas, cores e decorações de janela
-- ============================================================================

local wezterm = require 'wezterm'
local M = {}

---Aplica configurações de aparência
---@param config table
function M.apply(config)
  -- ============================================================================
  -- TEMA
  -- ============================================================================
  config.color_scheme = 'Catppuccin Macchiato'
  
  -- Cores customizadas (override do tema)
  config.colors = {
    background = '#181926',  -- Catppuccin Crust (mais escuro que Mantle)
    cursor_bg = '#C6A0F6',   -- Roxo Mauve
    cursor_fg = '#181926',
    cursor_border = '#C6A0F6',
  }

  -- ============================================================================
  -- JANELA
  -- ============================================================================
  config.initial_cols = 120
  config.initial_rows = 30
  
  -- Janela sem barra de título do Windows (mais limpo)
  config.window_decorations = 'RESIZE'
  config.window_background_opacity = 1.0
  config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  }

  -- ============================================================================
  -- CURSOR
  -- ============================================================================
  -- Cursor retangular roxo SEM piscar
  config.default_cursor_style = 'SteadyBlock'
  config.cursor_thickness = 3
  config.force_reverse_video_cursor = false

  -- ============================================================================
  -- CONFIGURAÇÕES VISUAIS EXTRAS
  -- ============================================================================
  config.enable_scroll_bar = false
  config.bold_brightens_ansi_colors = "BrightAndBold"
  config.hide_mouse_cursor_when_typing = true
  config.window_close_confirmation = 'NeverPrompt'
  config.status_update_interval = 1000
end

-- ============================================================================
-- TEMAS ALTERNATIVOS (descomente para usar)
-- ============================================================================
M.themes = {
  catppuccin_macchiato = 'Catppuccin Macchiato',
  catppuccin_mocha = 'Catppuccin Mocha',
  catppuccin_frappe = 'Catppuccin Frappe',
  catppuccin_latte = 'Catppuccin Latte',
  tokyo_night = 'Tokyo Night',
  tokyo_night_storm = 'Tokyo Night Storm',
  dracula = 'Dracula',
  nord = 'Nord',
  gruvbox_dark = 'Gruvbox Dark',
  one_dark = 'One Dark (Gogh)',
  solarized_dark = 'Solarized Dark (Gogh)',
  everforest = 'Everforest Dark (Gogh)',
}

return M
