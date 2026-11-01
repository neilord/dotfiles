#!/usr/bin/env bash
# Sets up a Mac from these dotfiles. Safe to run again: every step skips what's already done.
#   git clone --recursive https://github.com/neilord/dotfiles ~/dotfiles && ~/dotfiles/install.sh
set -euo pipefail

cd "$(dirname "$0")"
packages=(zsh nvim tmux git lazygit bat theme karabiner mpv yabai)

step() { printf '\n\033[1m%s\033[0m\n' "$*"; }

step "Homebrew"
if ! command -v brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew bundle --file Brewfile

step "Submodules (Neovim config, mpv scripts)"
git submodule update --init --recursive

step "oh-my-zsh, powerlevel10k and plugins"
[[ -d ~/.oh-my-zsh ]] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
custom=~/.oh-my-zsh/custom
clone() { [[ -d "$custom/$2" ]] || git clone --depth 1 "https://github.com/$1" "$custom/$2"; }
clone romkatv/powerlevel10k themes/powerlevel10k
clone zsh-users/zsh-autosuggestions plugins/zsh-autosuggestions
clone zsh-users/zsh-completions plugins/zsh-completions
clone zsh-users/zsh-syntax-highlighting plugins/zsh-syntax-highlighting
clone zpm-zsh/undollar plugins/undollar

step "Linking configs"
target=${DOTFILES_TARGET:-$HOME} # another folder, to try the linking safely
mkdir -p "$target/.config"
# a file stow would refuse to replace is moved aside instead of failing the whole run
for package in "${packages[@]}"; do
    while IFS= read -r conflict; do
        echo "  moving existing $target/$conflict to $conflict.before-dotfiles"
        mv "$target/$conflict" "$target/$conflict.before-dotfiles"
    done < <(stow --no -t "$target" "$package" 2>&1 | sed -n 's/.* over existing target \(.*\) since .*/\1/p')
done
stow -t "$target" "${packages[@]}"
[[ $target == "$HOME" ]] || exit 0

step "Theme"
~/.config/theme/theme sync
~/.config/theme/theme install-watcher

step "Done"
cat <<'EOF'
Left to do by hand:
  - Neovim nightly: unpack it into ~/nvim-macos (https://github.com/neovim/neovim/releases/tag/nightly)
  - secrets: ~/.config/secrets.zsh (chmod 600), sourced by .zshrc, never committed
  - Karabiner-Elements and yabai need their macOS permissions granted once
  - open a new terminal, or run: exec zsh
EOF
