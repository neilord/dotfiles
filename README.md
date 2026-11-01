# dotfiles

My macOS setup: zsh, Neovim, tmux and iTerm2, one theme across all of them, Karabiner and yabai for
the keyboard and windows.

```sh
git clone --recursive https://github.com/neilord/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` installs the [Brewfile](Brewfile), oh-my-zsh with powerlevel10k and its plugins, links
every package into place with [GNU Stow](https://www.gnu.org/software/stow/), and applies the theme.
It can run again at any time.

## Layout

Each top-level folder is a Stow package that mirrors where its files go in `~`, so
`tmux/.config/tmux/tmux.conf` becomes `~/.config/tmux/tmux.conf`. The links point back here: editing
a config edits the repo.

| Package | What |
|---|---|
| `zsh` | `.zshrc`, `.zprofile`, `.zshenv`, `.p10k.zsh` (oh-my-zsh, powerlevel10k) |
| `nvim` | Neovim, a submodule: [neilord/nvim-config](https://github.com/neilord/nvim-config) |
| `tmux` | tmux, with the bar colored by the theme |
| `theme` | one theme for the terminal, tmux, Neovim and the CLI tools; see [its README](theme/.config/theme/README.md) |
| `git` | git and delta |
| `lazygit` | lazygit |
| `bat` | bat's syntax themes |
| `karabiner` | Karabiner-Elements keyboard rules |
| `yabai` | yabai window tiling |
| `mpv` | mpv: shaders, scripts (two are submodules), subtitle fonts |

Add a package: create `<name>/.config/<name>/`, move the config in, add it to `packages` in
`install.sh` and run `stow -t ~ <name>`. Remove one: `stow -D -t ~ <name>`, then delete the folder.

## Not in the repo

- **Secrets** go in `~/.config/secrets.zsh` (chmod 600), which `.zshrc` sources.
- **App state**: everything else in `~/.config` (gcloud, gh, raycast and so on) belongs to the apps
  that write it.
- **Generated files**: the theme renders into `~/.local/state/theme`; Karabiner's backups, mpv's
  watch-later and lazygit's state are ignored.
