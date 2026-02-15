# WezTerm Configuration

Configuração personalizada do WezTerm para Windows com WSL Ubuntu e Fish Shell.

## Screenshot

![WezTerm Screenshot](assets/screenshot.png)

## Tema

- **Catppuccin Macchiato** - Background escuro (`#1e2030`)
- **Cursor**: Retangular roxo (`#C6A0F6`)
- **Fonte**: JetBrains Mono Nerd Font (10pt)

## Shell

- **Default**: Fish Shell no WSL Ubuntu
- **Prompt**: Starship com tema Catppuccin

## Features

### Tab Bar

- Tabs na parte inferior
- Mostra: número, ícone do processo, diretório, branch git
- Cores: Catppuccin Macchiato

### Status Bar

- **Left**: Username ~ Diretório
- **Right**: Versão WezTerm | Data | Hora

### Eventos Personalizados

- `format-tab-title`: Formatação customizada das tabs
- `update-status`: Barra de status inferior
- `new-tab-button`: Ações customizadas ao clicar no botão de nova tab
- `augment-command-palette`: Comandos adicionais no palette

## Uso

1. Clone este repositório em `C:\Users\<seu-usuario>\.config\wezterm\`
2. Instale a fonte [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
3. Instale o [Starship](https://starship.rs/) no WSL Ubuntu e instale Fish terminal
4. Configure o Fish: `cp ~/.config/starship.toml ~/.config/starship.toml`
5. Reinicie o WezTerm

## Configuração do Starship

Crie `~/.config/starship.toml` no WSL:

```toml
scan_timeout = 100
command_timeout = 2000
add_newline = false

format = """
$username\
[@](bold fg:text)\
$directory\
[ in ](bold fg:text)\
$git_branch\
$line_break\
$character"""

# ... (resto da configuração)
```

## Personalização

Edite `wezterm.lua` para ajustar:

- Tamanho da fonte: `config.font_size`
- Cores: `config.colors`
- Padding: `config.window_padding`
- Cursor: `config.default_cursor_style`

## Licença

MIT License
