# 📚 Exemplos de Customização

Este arquivo contém exemplos práticos de como personalizar sua configuração do WezTerm usando a estrutura modular.

---

## 🎨 Customizando Temas (appearance.lua)

### Exemplo 1: Mudar para Tokyo Night

```lua
-- config/appearance.lua
function M.apply(config)
  config.color_scheme = 'Tokyo Night'

  -- Cores customizadas para combinar
  config.colors = {
    background = '#1a1b26',
    cursor_bg = '#c0caf5',
    cursor_fg = '#1a1b26',
    cursor_border = '#c0caf5',
  }

  -- ... resto da configuração
end
```

### Exemplo 2: Tema Dracula com Background Transparente

```lua
function M.apply(config)
  config.color_scheme = 'Dracula'

  config.window_background_opacity = 0.9  -- 90% opacidade
  config.window_decorations = 'RESIZE'

  config.colors = {
    background = '#282a36',
    cursor_bg = '#bd93f9',
  }
end
```

### Exemplo 3: Nord com Padding Maior

```lua
function M.apply(config)
  config.color_scheme = 'Nord'

  config.window_padding = {
    left = 16,   -- Maior que o padrão (8)
    right = 16,
    top = 16,
    bottom = 16,
  }
end
```

---

## 🔤 Customizando Fontes (fonts.lua)

### Exemplo 1: Fira Code com Ligaduras

```lua
-- config/fonts.lua
function M.apply(config)
  config.font = wezterm.font('FiraCode Nerd Font', {
    weight = 'Regular',
  })

  config.font_size = 11.0  -- Um pouco maior
  config.line_height = 1.3

  -- Habilitar ligaduras
  config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
end
```

### Exemplo 2: Cascadia Code com Fonte Diferente para Negrito

```lua
function M.apply(config)
  config.font = wezterm.font_with_fallback({
    {
      family = 'CaskaydiaCove Nerd Font',
      weight = 'Regular',
    },
    'Noto Color Emoji',  -- Fallback para emojis
  })

  config.font_size = 10.5

  -- Customizar negrito
  config.font_rules = {
    {
      intensity = 'Bold',
      font = wezterm.font('CaskaydiaCove Nerd Font', {
        weight = 'Bold',
      }),
    },
  }
end
```

### Exemplo 3: Victor Mono com Itálico para Comentários

```lua
function M.apply(config)
  config.font = wezterm.font('VictorMono Nerd Font')
  config.font_size = 10.0

  config.font_rules = {
    {
      italic = true,
      font = wezterm.font('VictorMono Nerd Font', {
        weight = 'Regular',
        style = 'Italic',
      }),
    },
  }
end
```

---

## ⌨️ Customizando Atalhos (keymaps.lua)

### Exemplo 1: Adicionar Atalhos para Tabs Numeradas

```lua
-- config/keymaps.lua
function M.apply(config)
  config.keys = {
    -- ... atalhos existentes

    -- Ir para tab específica (Alt+Número)
    { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
    { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
    { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
    { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
    { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
  }
end
```

### Exemplo 2: Modo de Redimensionamento de Painéis

```lua
function M.apply(config)
  config.keys = {
    -- ... atalhos existentes

    -- Entrar no modo de resize (Ctrl+Shift+R)
    {
      key = 'r',
      mods = 'CTRL|SHIFT',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      },
    },
  }

  -- Tabela de teclas para modo resize
  config.key_tables = {
    resize_pane = {
      { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 5 } },
      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 5 } },
      { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 5 } },
      { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 5 } },

      -- ESC ou Enter para sair do modo
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'Enter', action = 'PopKeyTable' },
    },
  }
end
```

### Exemplo 3: Copiar/Colar Estilo Vim

```lua
function M.apply(config)
  config.keys = {
    -- ... atalhos existentes

    -- Copiar (Ctrl+Shift+C)
    {
      key = 'c',
      mods = 'CTRL|SHIFT',
      action = act.CopyTo 'Clipboard',
    },

    -- Colar (Ctrl+Shift+V) - já existe
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = act.PasteFrom 'Clipboard',
    },

    -- Modo de cópia estilo Vim (Ctrl+Shift+X)
    {
      key = 'x',
      mods = 'CTRL|SHIFT',
      action = act.ActivateCopyMode,
    },
  }
end
```

---

## 🐚 Customizando Shell (shell.lua)

### Exemplo 1: PowerShell como Padrão

```lua
-- config/shell.lua
function M.apply(config)
  config.default_prog = { 'pwsh.exe', '-NoLogo' }

  config.launch_menu = {
    { label = '⚡ PowerShell 7', args = { 'pwsh.exe', '-NoLogo' } },
    { label = '💻 PowerShell 5', args = { 'powershell.exe' } },
    { label = '🐟 WSL Fish', args = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' } },
    { label = '🐚 WSL Bash', args = { 'wsl.exe', '-d', 'Ubuntu' } },
  }
end
```

### Exemplo 2: Múltiplas Distribuições WSL

```lua
function M.apply(config)
  config.default_prog = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' }

  config.wsl_domains = {
    { name = 'WSL:Ubuntu', distribution = 'Ubuntu', default_cwd = '~' },
    { name = 'WSL:Debian', distribution = 'Debian', default_cwd = '~' },
    { name = 'WSL:Alpine', distribution = 'Alpine', default_cwd = '~' },
  }

  config.launch_menu = {
    { label = '🟠 Ubuntu Fish', args = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' } },
    { label = '🔴 Debian Bash', args = { 'wsl.exe', '-d', 'Debian' } },
    { label = '⛰️  Alpine Ash', args = { 'wsl.exe', '-d', 'Alpine' } },
    { label = '⚡ PowerShell', args = { 'pwsh.exe', '-NoLogo' } },
  }
end
```

### Exemplo 3: Git Bash no Windows

```lua
function M.apply(config)
  config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-i', '-l' }

  config.launch_menu = {
    {
      label = '🦊 Git Bash',
      args = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-i', '-l' },
    },
    { label = '⚡ PowerShell', args = { 'pwsh.exe', '-NoLogo' } },
    { label = '💻 CMD', args = { 'cmd.exe' } },
  }
end
```

---

## 📑 Customizando Tabs (tabs.lua)

### Exemplo 1: Tabs no Topo com Fancy Style

```lua
-- config/tabs.lua
function M.apply(config)
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = true  -- Esconder se só houver 1
  config.use_fancy_tab_bar = true  -- Estilo nativo do sistema
  config.tab_bar_at_bottom = false  -- Topo em vez de baixo
  config.tab_max_width = 30
end
```

### Exemplo 2: Tabs Minimalistas

```lua
function M.apply(config)
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = false
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.tab_max_width = 20  -- Mais estreitas

  -- Cores minimalistas
  config.colors = config.colors or {}
  config.colors.tab_bar = {
    background = '#181926',

    active_tab = {
      bg_color = '#363a4f',
      fg_color = '#cad3f5',
    },

    inactive_tab = {
      bg_color = '#24273a',
      fg_color = '#6e738d',
    },

    inactive_tab_hover = {
      bg_color = '#313244',
      fg_color = '#a6adc8',
    },
  }
end
```

---

## 🔧 Combinando Customizações

### Exemplo: Setup Completo para Desenvolvimento

```lua
-- config/appearance.lua
config.color_scheme = 'Tokyo Night Storm'
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.window_background_opacity = 0.95

-- config/fonts.lua
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 11.0

-- config/keymaps.lua
-- Adicionar atalhos para navegação rápida entre projetos
config.keys = {
  -- ... atalhos padrão

  -- Abrir novo tab em diretório específico
  {
    key = 'p',
    mods = 'CTRL|ALT',
    action = act.SpawnCommandInNewTab {
      args = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish', '-C', 'cd ~/projects' },
    },
  },
}
```

---

## 🔥 Mais Recursos

- [WezTerm Key Assignments](https://wezfurlong.org/wezterm/config/keys.html)
- [WezTerm Color Schemes](https://wezfurlong.org/wezterm/colorschemes/index.html)
- [Nerd Fonts Gallery](https://www.nerdfonts.com/)

---

## 🐟 Fish Shell Configuration (Complemento)

**Arquivo**: `~/.config/fish/config.fish` (dentro do WSL Ubuntu)

```fish
# Inicializar Starship
starship init fish | source

# Desabilitar o greeting do Fish
set fish_greeting

# Catppuccin Macchiato colors for Fish syntax highlighting
set -g fish_color_normal CAD3F5
set -g fish_color_command 8AADF4
set -g fish_color_quote A6DA95
set -g fish_color_redirection F5BDE6
set -g fish_color_end F5A97F
set -g fish_color_error ED8796
set -g fish_color_param C6A0F6
set -g fish_color_comment 6E738D
set -g fish_color_match 8AADF4
set -g fish_color_selection --background=363A4F
set -g fish_color_search_match --background=5B6078
set -g fish_color_operator F5BDE6
set -g fish_color_escape EED49F
set -g fish_color_autosuggestion 6E738D
set -g fish_color_cancel ED8796

# Completion pager colors
set -g fish_pager_color_progress 6E738D
set -g fish_pager_color_prefix 8AADF4
set -g fish_pager_color_completion CAD3F5
set -g fish_pager_color_description 6E738D
set -g fish_pager_color_selected_background --background=363A4F

# LS_COLORS - Catppuccin Macchiato
set -gx LS_COLORS "\
di=1;34:\
ln=1;36:\
so=1;35:\
pi=1;33:\
ex=1;32:\
bd=1;33:\
cd=1;33:\
su=1;31:\
sg=1;31:\
tw=1;34:\
ow=1;34:\
*.tar=1;31:\
*.gz=1;31:\
*.zip=1;31:\
*.jpg=1;35:\
*.png=1;35:\
*.mp3=1;36:\
*.mp4=1;36"

# Alias para ls com cores melhores
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

# ===========================
# ALIASES ÚTEIS
# ===========================
# Navegação rápida
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

# Git shortcuts
alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log --oneline'
alias gd 'git diff'

# Outras utilidades
alias c 'clear'
alias h 'history'
alias q 'exit'

# ===========================
# FUNÇÕES ÚTEIS
# ===========================
# Criar diretório e entrar nele
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

# Extrair arquivos com um único comando
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' não pode ser extraído via extract()"
        end
    else
        echo "'$argv[1]' não é um arquivo válido"
    end
end

# ===========================
# VARIÁVEIS DE AMBIENTE
# ===========================
# Editor padrão
set -gx EDITOR nano

# Adicionar ~/.local/bin ao PATH se existir
if test -d ~/.local/bin
    set -gx PATH ~/.local/bin $PATH
end
```

---

## Starship Configuration

**Arquivo**: `~/.config/starship.toml` (dentro do WSL Ubuntu)

```toml
# Catppuccin Macchiato - Optimized two-line prompt
# Performance settings
scan_timeout = 100
command_timeout = 2000
add_newline = false

format = """
$username\
[@](bold fg:text)\
$directory\
[ in ](bold fg:text)\
$git_branch\
$git_status\
$nodejs\
$python\
$line_break\
$character"""

palette = 'catppuccin_macchiato'

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"

[username]
show_always = true
style_user = "bold fg:red"
format = '[$user]($style)'

[directory]
style = "bold fg:blue"
format = "[$path]($style)"
truncation_length = 5
truncation_symbol = "…/"
truncate_to_repo = false
read_only = " 󰌾"
home_symbol = "~"

[git_branch]
symbol = " "
style = "bold fg:mauve"
format = '[\($symbol$branch\)]($style)'

[git_status]
disabled = false
style = "bold fg:mauve"
format = '([$all_status$ahead_behind]($style) )'
conflicted = "="
ahead = "⇡${count}"
behind = "⇣${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
untracked = "?${count}"
stashed = "$${count}"
modified = "!${count}"
staged = "+${count}"
renamed = "»${count}"
deleted = "✘${count}"

[nodejs]
symbol = " "
style = "fg:green"
format = '[ $symbol$version]($style)'
detect_files = ["package.json"]
detect_folders = ["node_modules"]

[python]
symbol = " "
style = "fg:green"
format = '[ $symbol$version]($style)'
detect_files = ["requirements.txt", "pyproject.toml", ".python-version"]

[character]
success_symbol = '[-λ](bold green)'
error_symbol = '[-λ](bold red)'

[line_break]
disabled = false

# Desabilitar módulos não usados para performance
[rust]
disabled = true

[golang]
disabled = true

[php]
disabled = true

[docker_context]
disabled = true

[package]
disabled = true
```

---

## 🚀 Como aplicar estas configurações

### 1. Instalar Starship (dentro do WSL Ubuntu)

```bash
curl -sS https://starship.rs/install.sh | sh
```

### 2. Criar o arquivo config.fish

```bash
mkdir -p ~/.config/fish
nano ~/.config/fish/config.fish
# Cole o conteúdo acima e salve (Ctrl+X, Y, Enter)
```

### 3. Criar o arquivo starship.toml

```bash
mkdir -p ~/.config
nano ~/.config/starship.toml
# Cole o conteúdo acima e salve (Ctrl+X, Y, Enter)
```

### 4. Recarregar configurações

```bash
source ~/.config/fish/config.fish
```

---

## Resultado Esperado

```
username@diretório in ( branch !2 ?1)  node v20.0.0
-λ
```

Onde:

- **username@diretório** - usuário e pasta atual em cores
- **in** - separador
- **( branch)** - branch do git entre parênteses
- **!2 ?1** - status do git (2 modificados, 1 não rastreado)
- ** node v20.0.0** - versões detectadas de linguagens
- **-λ** - símbolo do prompt (verde = sucesso, vermelho = erro)
