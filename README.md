# dotfiles

My macOS setup: zsh, Neovim, tmux and iTerm2, one theme across all of them, Karabiner and yabai for
the keyboard and windows.

```sh
git clone --recursive https://github.com/neilord/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` installs the [Brewfile](Brewfile), oh-my-zsh with powerlevel10k and its plugins, links
every package into place with [GNU Stow](https://www.gnu.org/software/stow/), and applies the theme.
On a Mac with existing configs, review them before running the installer. The current script moves
conflicting files to paths ending in `.before-dotfiles`.

## Layout

Keep the checkout at `~/dotfiles`. The installer resolves its own location and gives Stow an
explicit target of `$HOME`, so a different checkout path also works.

Use one Brewfile for CLI tools, desktop apps, and fonts. Each top-level config folder is a Stow
package that mirrors where its files go in `~`, so
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

## Tool index

The [Brewfile](Brewfile) is the source of truth for Homebrew installs.

| Area | Tools to restore |
|---|---|
| Shell and terminal | zsh, Oh My Zsh, Powerlevel10k, iTerm2, tmux, JetBrains Mono Nerd Font, Stow |
| Search and shell utilities | ripgrep (`rg`), fd, fzf, eza, bat, zoxide, jq |
| Editor and Git | Neovim, Git, GitHub CLI, Lazygit, delta, macOS SSH |
| Development | Xcode Command Line Tools, Node 24, nvm, pnpm, Docker Desktop with Compose, uv |
| AI coding | Codex CLI and Claude Code |
| Desktop | Aside (primary browser), Raycast, ChatGPT, Claude, Karabiner-Elements, yabai |
| Media | mpv, ffmpeg for subtitle sync, socat for the mpv pause/play shortcut |
| Network and payments | Tailscale, Stripe CLI |

### Fresh Mac checklist

1. Install the Xcode Command Line Tools with `xcode-select --install`, then clone and run the installer above.
2. Install the Neovim nightly under `~/nvim-macos` as described by the installer.
3. Open Aside and sign in. Launch Docker Desktop once to initialize the engine and Compose.
4. Sign in to GitHub, Codex, Claude Code, and other apps you use. Restore SSH access and grant
   the macOS permissions needed by Karabiner-Elements and yabai.
5. In each project, check `node --version` and `pnpm --version` against its declared requirements.

Add a tool to the Brewfile when it belongs on a fresh Mac, even if it needs no config. Add
a Stow package when there are settings to maintain. For tools installed outside Homebrew,
record the install method here. Keep project-specific runtime constraints and Compose services
in their project repositories.

## Local files

- **Secrets** go in `~/.config/secrets.zsh` (chmod 600), which `.zshrc` sources.
- **App state and credentials** stay with the app or in the appropriate backup or password manager.
  Use sign-in or supported settings exports to restore apps.
- **Generated files**: the theme renders into `~/.local/state/theme`; Karabiner's backups, mpv's
  watch-later and lazygit's state are ignored.

## Migration order

1. Review the local zsh, Karabiner, and yabai changes and verify that the pinned Neovim config
   commit is accessible from a fresh clone. Keep the submodule until its independent use is settled.
2. Make the installer report existing config conflicts before linking. Verify links with a temporary
   target.
3. Make Neovim installation repeatable and verify the Node and pnpm versions in a real project.
4. Test a fresh clone in a clean macOS account. Check the shell, Neovim, Lazygit, GitHub and SSH
   access, then run a project with its declared pnpm version and Docker Compose.
