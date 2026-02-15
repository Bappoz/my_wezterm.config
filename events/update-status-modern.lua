---@module "events.update-status-modern"
---@author sravioli
---@license GNU-GPLv3

local wt = require "wezterm"

local M = {}

M.callback = function(window, pane)
  -- Usar pcall para evitar que erros quebrem o WezTerm
  pcall(function()
    -- LEFT STATUS - Usuário e diretório atual
    local username = os.getenv("USER") or os.getenv("USERNAME") or "user"
    local hostname = wt.hostname() or "hostname"
    
    -- Obter diretório atual
    local cwd = ""
    local is_wsl = false
    
    pcall(function()
      local cwd_uri = pane.current_working_dir
      if cwd_uri then
        -- Extrair o caminho do URI
        local path = ""
        if type(cwd_uri) == "userdata" then
          path = tostring(cwd_uri) or ""
        else
          path = cwd_uri
        end
        
        -- Verificar se é WSL e extrair o username
        local cwd_host = ""
        if type(cwd_uri) == "userdata" then
          local success, result = pcall(function()
            return cwd_uri:host() or ""
          end)
          if success then
            cwd_host = result
          end
        end
        if cwd_host == "" then
          cwd_host = path:match("file://([^/]*)") or ""
        end
        if cwd_host and cwd_host ~= "" and cwd_host ~= hostname then
          username = cwd_host
          is_wsl = true
        end
        
        -- Extrair apenas o caminho após file://host
        cwd = path:match("file://[^/]*(.*)") or path
        cwd = cwd:gsub("\\", "/")
        
        if is_wsl then
          -- Lógica para WSL
          -- Substituir /mnt/c/Users/username por ~
          cwd = cwd:gsub("^/mnt/c/Users/" .. username, "~")
          cwd = cwd:gsub("^/mnt/%w/Users/" .. username, "~")
          
          -- Substituir /home/username por ~
          cwd = cwd:gsub("^/home/" .. username, "~")
        else
          -- Lógica para Windows
          local home = wt.home_dir:gsub("\\", "/")
          if cwd:find(home, 1, true) then
            cwd = "~" .. cwd:sub(#home + 1)
          end
        end
        
        -- Pegar apenas o nome do diretório atual (último segmento do caminho)
        if cwd == "~" or cwd == "" then
          cwd = "~"
        else
          local dir_name = cwd:match("/([^/]+)$")
          if dir_name and dir_name ~= "" then
            cwd = dir_name
          end
        end
      end
    end)
    
    -- Cores do Catppuccin Macchiato
    local colors = {
      bg = "#24273A",
      fg = "#CAD3F5",
      blue = "#8AADF4",
      mauve = "#C6A0F6",
      green = "#A6DA95",
      peach = "#F5A97F",
      teal = "#8BD5CA",
    }
    
    -- LEFT STATUS
    local left_elements = {}
    
    -- Ícone e username
    table.insert(left_elements, { Background = { Color = colors.bg } })
    table.insert(left_elements, { Foreground = { Color = colors.blue } })
    table.insert(left_elements, { Text = "  " .. username .. " " })
    
    -- Separador ~
    if cwd ~= "" then
      table.insert(left_elements, { Foreground = { Color = colors.fg } })
      table.insert(left_elements, { Text = "~ " })
      
      -- Diretório atual
      table.insert(left_elements, { Foreground = { Color = colors.mauve } })
      table.insert(left_elements, { Text = cwd .. " " })
    end
    
    window:set_left_status(wt.format(left_elements))
    
    -- RIGHT STATUS - Data, hora, versão
    local date = wt.strftime("%a %b %-d")
    local time = wt.strftime("%H:%M")
    local version = wt.version or "v1.0"
    
    local right_elements = {}
    
    -- Versão do WezTerm
    table.insert(right_elements, { Background = { Color = colors.bg } })
    table.insert(right_elements, { Foreground = { Color = colors.peach } })
    table.insert(right_elements, { Text = "  " .. version .. " " })
    
    -- Data
    table.insert(right_elements, { Foreground = { Color = colors.green } })
    table.insert(right_elements, { Text = "  " .. date .. " " })
    
    -- Hora
    table.insert(right_elements, { Foreground = { Color = colors.fg } })
    table.insert(right_elements, { Text = "  " .. time .. " " })
    
    window:set_right_status(wt.format(right_elements))
  end)
end

return M
