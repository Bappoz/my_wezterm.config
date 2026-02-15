# 🚀 WezTerm Configuration - Modular & Ready to Use

Configuração modular e elegante do WezTerm para Windows com WSL. Clone e use imediatamente!

## 📸 Preview

![WezTerm Screenshot](assets/screenshot.png)

## ✨ Features

- 🎨 **Tema Catppuccin Macchiato** (facilmente alterável)
- 🔤 **JetBrains Mono Nerd Font** com ícones
- 🐟 **Fish Shell** no WSL Ubuntu (configurável)
- 📑 **Tabs estilizadas** com ícones e informações
- ⌨️ **Atalhos customizados** para produtividade
- 📦 **Estrutura modular** - fácil de personalizar
- 🎯 **Pronto para usar** - basta clonar!

## 📁 Estrutura do Projeto

```
wezterm/
├── wezterm.lua           # Arquivo principal (limpo e simples)
├── config/               # 📦 Módulos de configuração
│   ├── init.lua         # Carregador de módulos
│   ├── appearance.lua   # Temas, cores, janela
│   ├── fonts.lua        # Configuração de fontes
│   ├── keymaps.lua      # Atalhos de teclado
│   ├── shell.lua        # Shell padrão e WSL
│   └── tabs.lua         # Configuração da tab bar
├── events/              # 🎭 Event handlers
│   ├── init.lua
│   ├── format-tab-title-modern.lua
│   ├── update-status-modern.lua
│   └── ...
└── assets/              # 🖼️ Recursos estáticos
    └── screenshot.png
```

## 🚀 Instalação Rápida

### 1. Clone o repositório

```bash
# Windows
git clone https://github.com/Bappoz/my_wezterm.config.git "%USERPROFILE%\.config\wezterm"

# Ou manualmente: Clone para C:\Users\<seu-usuario>\.config\wezterm\
```

### 2. Instale as dependências

- **WezTerm**: [Download](https://wezfurlong.org/wezterm/installation.html)
- **Nerd Font**: [JetBrains Mono](https://www.nerdfonts.com/font-downloads) (recomendado)
- **WSL Ubuntu**: `wsl --install -d Ubuntu` (Windows 11)
- **Fish Shell** (opcional): `sudo apt install fish` no WSL

### 3. Reinicie o WezTerm

Pronto! Sua configuração já está funcionando. 🎉

## ⚙️ Personalização

### 🎨 Mudar o Tema

Edite `config/appearance.lua`:

```lua
-- Temas disponíveis (descomente o que preferir)
config.color_scheme = 'Catppuccin Macchiato'  -- Padrão
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Dracula'
-- config.color_scheme = 'Nord'
-- config.color_scheme = 'Gruvbox Dark'
```

Lista completa em: `M.themes` no final do arquivo.

### 🔤 Mudar a Fonte

Edite `config/fonts.lua`:

```lua
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 10.0  -- Ajuste o tamanho
```

Fontes alternativas disponíveis em: `M.fonts`

### 🐚 Mudar o Shell Padrão

Edite `config/shell.lua`:

```lua
-- Para PowerShell
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- Para CMD
config.default_prog = { 'cmd.exe' }

-- Para WSL
config.default_prog = { 'wsl.exe', '-d', 'Ubuntu', '-e', 'fish' }
```

### ⌨️ Customizar Atalhos

Edite `config/keymaps.lua` para adicionar ou modificar atalhos.

## 🎮 Atalhos de Teclado

| Atalho             | Ação                             |
| ------------------ | -------------------------------- |
| `Ctrl+Shift+V`     | Dividir horizontal (lado a lado) |
| `Ctrl+Shift+H`     | Dividir vertical (cima e baixo)  |
| `Ctrl+Shift+W`     | Fechar painel atual              |
| `Ctrl+Shift+T`     | Nova tab                         |
| `Ctrl+Shift+F`     | Toggle fullscreen                |
| `Ctrl+Shift+Setas` | Navegar entre painéis            |
| `Ctrl+Shift+Space` | Quick Select (selecionar texto)  |
| `Ctrl+Shift+P`     | Paleta de comandos               |
| `Ctrl+Shift+L`     | Debug overlay                    |

Veja todos os atalhos em: `config/keymaps.lua`

## 🎯 Configuração Padrão

### Aparência

- **Tema**: Catppuccin Macchiato
- **Background**: `#181926` (Catppuccin Crust)
- **Cursor**: Retangular roxo (`#C6A0F6`)
- **Decoração**: Sem barra de título do Windows

### Fonte

- **Família**: JetBrains Mono Nerd Font
- **Tamanho**: 10pt
- **Line Height**: 1.2

### Shell

- **Padrão**: Fish no WSL Ubuntu
- **Launch Menu**: Fish, Bash, PowerShell, CMD

## 🛠️ Desenvolvimento

### Adicionar Novo Módulo de Configuração

1. Crie `config/seu-modulo.lua`:

```lua
local M = {}

function M.apply(config)
  -- Suas configurações aqui
end

return M
```

2. Adicione em `config/init.lua`:

```lua
function M.apply(config)
  -- ... módulos existentes
  local seu_modulo = require 'config.seu-modulo'
  seu_modulo.apply(config)
end
```

### Adicionar Novo Event Handler

1. Crie `events/seu-evento.lua`
2. Registre em `events/init.lua`

## 📚 Recursos Úteis

- [WezTerm Documentation](https://wezfurlong.org/wezterm/)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Fish Shell](https://fishshell.com/)
- [Starship Prompt](https://starship.rs/)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

- Reportar bugs
- Sugerir novas features
- Adicionar novos temas
- Melhorar a documentação

## 📝 Licença

MIT License - use livremente!

## 🌟 Créditos

Feito com ❤️ por [Bappoz](https://github.com/Bappoz)

---

**Nota**: Esta configuração é para Windows com WSL. Para Linux/macOS, ajuste os caminhos e o shell padrão conforme necessário.
