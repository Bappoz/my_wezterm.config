---@module "events.format-tab-title-modern"
---@author sravioli
---@license GNU-GPLv3

local wt = require "wezterm"

local M = {}

-- Helper para obter informações do git branch (SEM executar comandos externos)
local function get_git_branch(cwd)
  if not cwd then return nil end
  
  -- Tentar ler o arquivo .git/HEAD diretamente (mais seguro e rápido)
  local git_head_path = cwd .. "/.git/HEAD"
  local success, file = pcall(io.open, git_head_path, "r")
  if success and file then
    local head_content = file:read("*a")
    file:close()
    -- Extrair nome do branch de "ref: refs/heads/branch-name"
    local branch = head_content:match("ref: refs/heads/([^\n\r]+)")
    if branch then
      return branch
    end
  end
  return nil
end

-- Helper para obter nome do processo com ícone
local function get_process_info(pane)
  local process_name = pane.foreground_process_name
  if not process_name then return nil, nil end
  
  -- Extrair nome base do processo
  local process = process_name:match("([^/\\]+)%.?exe?$") or process_name:match("([^/\\]+)$")
  if not process then return nil, nil end
  
  -- Ícones para processos comuns
  local icons = {
    fish = " ",
    bash = " ",
    zsh = " ",
    powershell = "󰨊 ",
    pwsh = "󰨊 ",
    cmd = " ",
    nvim = " ",
    vim = " ",
    git = " ",
    node = " ",
    python = " ",
    cargo = " ",
    docker = " ",
  }
  
  local icon = icons[process:lower()] or " "
  return process, icon
end

-- Helper para formatar o diretório
local function format_cwd(cwd, home_dir, max_length)
  if not cwd then return "" end
  
  -- Converter caminho do WSL para formato mais legível
  cwd = cwd:gsub("^/mnt/(%a)/", "%1:/")
  
  -- Substituir home por ~
  if home_dir then
    cwd = cwd:gsub("^" .. home_dir:gsub("%-", "%%-"), "~")
  end
  
  -- Pegar apenas o nome do diretório atual
  local dir = cwd:match("([^/\\]+)$") or cwd
  
  -- Truncar se muito longo
  if #dir > max_length then
    dir = dir:sub(1, max_length - 3) .. "..."
  end
  
  return dir
end

M.callback = function(tab, tabs, panes, config, hover, max_width)
  if config.use_fancy_tab_bar or not config.enable_tab_bar then
    return
  end

  local pane = tab.active_pane
  local tab_idx = tab.tab_index
  
  -- Verificar se tem output não visto
  local has_unseen = false
  for _, p in ipairs(tab.panes) do
    if p.has_unseen_output then
      has_unseen = true
      break
    end
  end
  
  -- Obter informações do processo (com proteção contra erros)
  local process, process_icon = pcall(get_process_info, pane)
  if not process then
    process_icon = " "
  end
  
  -- Obter CWD (com proteção contra erros)
  local cwd = nil
  local home_dir = wt.home_dir
  
  pcall(function()
    local cwd_uri = pane.current_working_dir
    if cwd_uri then
      if type(cwd_uri) == "userdata" then
        cwd = cwd_uri.file_path
      else
        cwd = cwd_uri:match("file://[^/]*(.*)")
      end
    end
  end)
  
  -- Formatar diretório
  local dir_name = ""
  if cwd then
    local success, result = pcall(format_cwd, cwd, home_dir, 20)
    if success then
      dir_name = result
    end
  end
  
  -- Obter branch do git (com proteção contra erros)
  local git_branch = nil
  if cwd then
    local success, branch = pcall(get_git_branch, cwd)
    if success and branch then
      git_branch = branch
    end
  end
  
  -- Construir título
  local title_parts = {}
  
  -- Número da tab com indicador de unseen output
  table.insert(title_parts, has_unseen and " " or string.format(" %d", tab_idx + 1))
  
  -- Ícone do processo
  if process_icon then
    table.insert(title_parts, process_icon)
  end
  
  -- Nome do diretório
  if dir_name ~= "" then
    table.insert(title_parts, dir_name)
  end
  
  -- Branch do git
  if git_branch and git_branch ~= "" then
    table.insert(title_parts, string.format("  %s", git_branch))
  end
  
  local formatted_title = table.concat(title_parts, " ") .. " "
  
  -- Truncar se necessário
  if #formatted_title > max_width then
    formatted_title = formatted_title:sub(1, max_width - 3) .. "..."
  end

  return formatted_title
end

return M
