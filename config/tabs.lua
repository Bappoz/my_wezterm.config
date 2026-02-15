-- ============================================================================
-- TABS: Configurações da barra de tabs
-- ============================================================================

local M = {}

---Aplica configurações de tabs
---@param config table
function M.apply(config)
  -- ============================================================================
  -- TAB BAR
  -- ============================================================================
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = false
  config.use_fancy_tab_bar = false  -- Usar tab bar simples (mais customizável)
  config.tab_bar_at_bottom = true
  config.tab_max_width = 25
  
  -- Estilo da tab bar
  config.colors = config.colors or {}
  config.colors.tab_bar = {
    -- Fundo da barra de tabs (usa a cor de fundo)
    background = '#181926',
  }
end

return M
