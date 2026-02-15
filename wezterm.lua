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
-- Background mais escuro (Catppuccin Mantle)
config.colors = {
  background = '#1e2030',
  cursor_bg = '#C6A0F6',
  cursor_fg = '#1e2030',
  cursor_border = '#C6A0F6',
}

-- Window decorations
config.window_decorations = 'RESIZE'
config.window_background_opacity = 1.0

-- Cursor retangular roxo
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.cursor_thickness = 2
config.force_reverse_video_cursor = false

config.enable_scroll_bar = true
config.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }

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

