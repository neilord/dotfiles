# Theme

One theme for the terminal, tmux, Neovim and the command-line tools. Pick one with `<leader>tt` in
Neovim, or `theme set <name>` in a shell; `auto` follows macOS light and dark mode.

```
theme                  the switcher (theme, theme list, theme set <name|auto>, theme sync)
config                 the default theme, and the dark / light pair auto uses
themes/<name>.sh       a theme's colors: the only place they live
templates/             one file per tool, with {{color}} placeholders
appearance-watch.swift runs `theme sync` when macOS changes appearance (theme install-watcher)
```

Applying a theme renders every template into `~/.local/state/theme/`, recolors every open terminal
window, sets tmux's bar colors, and writes the theme's name to `~/.local/state/theme/current`.

| Tool | How it follows |
|---|---|
| Terminal (iTerm2, Ghostty, any) | escape sequences written to each window's tty; zsh replays them in new windows outside tmux |
| tmux | `@thm_*` options used by the bar in `tmux/tmux.conf`; `theme sync` runs on every attach |
| Neovim | watches `current`, loads the matching colorscheme; custom colors in `nvim/lua/config/theme.lua` |
| p10k | uses the terminal's 16 colors, plus the rendered `p10k.zsh`; zsh reloads it at the next prompt |
| lazygit | `LG_CONFIG_FILE` in `~/.zshrc` adds the rendered `lazygit.yml` |
| delta | `git/config` includes the rendered `delta.gitconfig` |
| bat | `BAT_CONFIG_PATH` in `~/.zshrc` points at the rendered `bat.conf` |
| eza | `EZA_CONFIG_DIR` in `~/.zshrc` points at the rendered `eza/` |
| zsh syntax highlighting, autosuggestions | the terminal's 16 colors |

Each tool reads its rendered file when it starts, so a running lazygit or bat keeps its colors until
reopened.

## Adding

- **A theme**: copy a file in `themes/`, change the colors, and install its Neovim colorscheme.
  `bat_theme` names a bat theme: a built-in one, or a `.tmTheme` in `~/.config/bat/themes` followed
  by `bat cache --build`.
- **A tool**: add its config to `templates/`, with `{{name}}` for any variable a theme file sets
  (plus `diff_minus`, `diff_plus`, their `_emph` versions and `on_accent_dim`, which the script
  derives), then point the tool at the rendered file in `~/.local/state/theme/`.
