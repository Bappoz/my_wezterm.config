-- ============================================================================
-- WezTerm Configuration
-- ============================================================================
local wezterm = require 'wezterm'
local config = {}

-- Usar config_builder se disponível
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============================================================================
-- SHELL PADRÃO: Fish no WSL Ubuntu
-- ============================================================================
config.default_prog = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' }

-- ============================================================================
-- TEMA: Catppuccin Macchiato
-- ============================================================================
config.color_scheme = 'Catppuccin Macchiato'

-- ============================================================================
-- FONTE: JetBrains Mono Nerd Font
-- ============================================================================
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' })
config.font_size = 10.0
config.line_height = 1.2

-- ============================================================================
-- TAB BAR
-- ============================================================================
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 25

-- ============================================================================
-- APARÊNCIA
-- ============================================================================
-- Background mais escuro (Catppuccin Crust - mais escuro que Mantle)
config.colors = {
  background = '#181926',  -- Crust (mais escuro)
  cursor_bg = '#C6A0F6',   -- Roxo Mauve
  cursor_fg = '#181926',   -- Texto do cursor igual ao fundo
  cursor_border = '#C6A0F6', -- Borda roxa
}

-- Remover barra de título do Windows
config.window_decorations = 'RESIZE'
config.window_background_opacity = 1.0

-- Cursor retangular roxo piscando
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 700
config.cursor_thickness = 3
config.force_reverse_video_cursor = false

-- Scrollbar e padding
config.enable_scroll_bar = true
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- ============================================================================
-- WSL DOMAINS
-- ============================================================================
config.wsl_domains = {
  {
    name = 'WSL:Ubuntu',
    distribution = 'Ubuntu',
    default_cwd = '~',
  },
}

-- ============================================================================
-- LAUNCH MENU
-- ============================================================================
config.launch_menu = {
  {
    label = 'PowerShell',
    args = { 'pwsh.exe', '-NoLogo' },
  },
  {
    label = 'Ubuntu Fish',
    args = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' },
  },
  {
    label = 'Ubuntu Bash',
    args = { 'wsl.exe', '-d', 'Ubuntu' },
  },
}

-- ============================================================================
-- EVENTOS PERSONALIZADOS
-- ============================================================================
pcall(function()
  local events = require("events")
  if events.setup then
    events.setup(config)
  end
end)

return config

