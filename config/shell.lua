-- ============================================================================
-- SHELL: Configurações de shell padrão e WSL
-- ============================================================================

local M = {}

---Aplica configurações de shell
---@param config table
function M.apply(config)
  -- ============================================================================
  -- SHELL PADRÃO: Fish no WSL Ubuntu
  -- ============================================================================
  config.default_prog = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' }

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
      label = '🐟 Ubuntu Fish',
      args = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' },
    },
    {
      label = '🐚 Ubuntu Bash',
      args = { 'wsl.exe', '-d', 'Ubuntu' },
    },
    {
      label = '⚡ PowerShell',
      args = { 'pwsh.exe', '-NoLogo' },
    },
    {
      label = '💻 CMD',
      args = { 'cmd.exe' },
    },
  }
end

return M
