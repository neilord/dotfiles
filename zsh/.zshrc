# Agent shells need the environment from .zshenv without interactive customizations.
if [[ -n ${CODEX_EXEC:-}${CODEX_CLI:-}${CODEX_THREAD_ID:-}${CODEX_SESSION_ID:-} ||
      -n ${CLAUDECODE:-}${CLAUDE_CODE_ENTRYPOINT:-} ||
      ${TERM_PROGRAM:-} == Codex ]]; then
  return
fi

[[ -r "$XDG_CONFIG_HOME/secrets.zsh" ]] && source "$XDG_CONFIG_HOME/secrets.zsh"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k
[[ -n $NVIM ]] && ZSH_THEME=robbyrussell
DISABLE_LS_COLORS=true # Oh My Zsh otherwise aliases ls.
plugins=(git undollar zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

bindkey -v
MAILCHECK=0
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# Keep command-mode shells and redirected invocations on the standard commands.
if [[ -o interactive && -z $ZSH_EXECUTION_STRING && -t 0 && -t 1 ]]; then
  (( $+commands[eza] )) && alias ls=eza
  (( $+functions[z] )) && alias cd=z
fi

# Keep the terminal apps and Powerlevel10k in step with the shared theme.
_theme="${XDG_STATE_HOME:-$HOME/.local/state}/theme"
export BAT_CONFIG_PATH="$_theme/bat.conf"
export EZA_CONFIG_DIR="$_theme/eza"
if [[ -r "$_theme/lazygit.yml" ]]; then
  export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$_theme/lazygit.yml"
fi
if [[ -t 1 && -z $TMUX && -r "$_theme/terminal.seq" ]]; then
  /bin/cat "$_theme/terminal.seq"
fi

if (( $+functions[p10k] )); then
  [[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

  _theme_follow() {
    [[ -r "$_theme/current" && -r "$_theme/p10k.zsh" ]] || return 0
    local current
    current=$(<"$_theme/current")
    [[ $current == $_theme_current ]] && return 0
    source "$_theme/p10k.zsh"
    _theme_current=$current
    p10k reload
  }

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _theme_follow
  _theme_follow
fi

# Convenience shortcuts for interactive use.
(( $+commands[nvim] )) && alias vim=nvim
alias lg=lazygit
alias ll='eza -lbF --git'
alias la='eza -la --git'
alias lt='eza --tree --level=2'
