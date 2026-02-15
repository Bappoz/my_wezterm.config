# Exemplos de Configuração

Este arquivo contém exemplos completos das configurações necessárias para o Fish e Starship.

---

## Fish Shell Configuration

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
