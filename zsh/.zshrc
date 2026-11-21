# Codex runs its own shells; skip the prompt setup there
if [[ -n "$CODEX_EXEC" || -n "$CODEX_CLI" || "$TERM_PROGRAM" == "Codex" ]]; then
  POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
  return 0
fi

## environment
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export ESLINT_USE_FLAT_CONFIG=true
export NVM_DIR="/opt/homebrew/opt/nvm"
export ANDROID_AVD_HOME="$HOME/.config/.android/avd"

typeset -U path # no duplicate entries
path=(
  $HOME/nvim-macos/bin # Neovim nightly
  /usr/local/smlnj/bin
  $path
)
. "$HOME/.deno/env"

# secrets stay out of the dotfiles repo
[[ -r $XDG_CONFIG_HOME/secrets.zsh ]] && source $XDG_CONFIG_HOME/secrets.zsh

## oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="robbyrussell" # Neovim's terminal
fi
ENABLE_CORRECTION="true"
plugins=(git undollar zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
source $ZSH/oh-my-zsh.sh

## prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

## theme: ~/.config/theme renders each tool's colors into ~/.local/state/theme
_theme=${XDG_STATE_HOME:-$HOME/.local/state}/theme
export BAT_CONFIG_PATH=$_theme/bat.conf EZA_CONFIG_DIR=$_theme/eza
export LG_CONFIG_FILE=$HOME/.config/lazygit/config.yml,$_theme/lazygit.yml
[[ -t 1 && -z $TMUX && -r $_theme/terminal.seq ]] && printf '%s' "$(<$_theme/terminal.seq)" # a new window outside tmux
[[ -r $_theme/p10k.zsh ]] && source $_theme/p10k.zsh
[[ -r $_theme/current ]] && _theme_current=$(<$_theme/current)
_theme_follow() { # a theme switch reaches the prompt at its next redraw
  [[ -r $_theme/current ]] || return
  local current=$(<$_theme/current)
  [[ "$current" == "$_theme_current" ]] && return
  _theme_current=$current
  source $_theme/p10k.zsh
  (( $+functions[p10k] )) && p10k reload
}
precmd_functions=(_theme_follow $precmd_functions)

## shell
set -o vi
MAILCHECK=0
eval "$(zoxide init zsh --cmd cd --hook prompt)"

# nvm loads on first use
lazy_load_nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
nvm() { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }

export NODE_AUTH_TOKEN="$(gh auth token)" # GitHub Packages in .npmrc

## aliases
alias vim='nvim'
alias cat='bat'
alias oc='ocv'
alias ssh="TERM=xterm-256color ssh"
alias hold="pbpaste > /tmp/hold_clip"
alias unhold="command cat /tmp/hold_clip | pbcopy"

alias ls="eza"
alias ll='eza -lbF --git'                                              # list, size, type, git
alias llm='eza -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='eza -1'                                                      # one column, just names
alias lt='eza --tree --level=2'                                        # tree
alias tree='eza --tree'
