-- ============================================================================
-- WezTerm Configuration
-- ============================================================================
-- CONFIGURAÇÃO COMPLETA E FUNCIONAL
-- 
--  Fish shell no WSL Ubuntu
--  Tema Catppuccin Macchiato
--  Fonte JetBrains Mono Nerd Font
--  Tabs estilizadas com ícones e git branch
--  Status bar com usuário, data e hora
--  Atalhos de teclado customizados
-- 
-- Para configurar o Fish no Ubuntu WSL:
-- 1. Abra o WezTerm com Fish
-- 2. Execute: mkdir -p ~/.config/fish
-- 3. Execute: cp /mnt/c/Users/landr/.config/fish/config.fish ~/.config/fish/
-- 4. Execute: source ~/.config/fish/config.fish
-- 
-- ATALHOS ÚTEIS:
--   Ctrl+Shift+P  - Paleta de comandos (trocar tema, fonte, etc)
--   Ctrl+Shift+L  - Debug overlay
--   Botão direito no "+" - Menu de shells
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
-- Cores customizadas (override do tema)
config.colors = {
  background = '#181926',  -- Catppuccin Crust (mais escuro que Mantle)
  cursor_bg = '#C6A0F6',   -- Roxo Mauve
  cursor_fg = '#181926',
  cursor_border = '#C6A0F6',
}

config.initial_cols = 120
config.initial_rows = 30

-- Janela sem barra de título do Windows
config.window_decorations = 'RESIZE'
config.window_background_opacity = 1.0
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- Cursor retangular roxo SEM piscar
config.default_cursor_style = 'SteadyBlock'
config.cursor_thickness = 3
config.force_reverse_video_cursor = false

-- Scrollbar
config.enable_scroll_bar = false

-- Configurações visuais adicionais
config.bold_brightens_ansi_colors = "BrightAndBold"
config.hide_mouse_cursor_when_typing = true
config.window_close_confirmation = 'NeverPrompt'

-- Status bar sempre visível
config.status_update_interval = 1000

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


local act = wezterm.action

config.keys = {
  -- 1. Dividir Horizontalmente (Lado a Lado)
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- 2. Dividir Verticalmente (Cima e Baixo)
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  { 
    key = 'f', 
    mods = 'CTRL|SHIFT', 
    action = wezterm.action.ToggleFullScreen },

}

-- ============================================================================
-- CARREGAR MÓDULOS EXTRAS (se disponíveis)
-- ============================================================================
-- Eventos reativados gradualmente com proteção contra erros
pcall(function()
  -- Adicionar caminho do módulo
  local config_path = wezterm.home_dir .. '/.config/wezterm'
  package.path = package.path .. ';' .. config_path .. '/?.lua'
  package.path = package.path .. ';' .. config_path .. '/?/init.lua'
  
  -- Carregar eventos (com proteções individuais dentro)
  local has_events, events = pcall(require, "events")
  if has_events and events.setup then
    events.setup(config)
  end
  
  -- Carregar mappings (atalhos de teclado)
  local has_mappings, mappings = pcall(require, "mappings")
  if has_mappings and mappings then
    if mappings.keys then
      config.keys = mappings.keys
    end
    if mappings.key_tables then
      config.key_tables = mappings.key_tables
    end
  end
end)

return config
