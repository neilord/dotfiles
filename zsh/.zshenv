# Available to interactive shells, scripts, and agent subprocesses.
typeset -U path

# Add installed user tools and prefer the project's Node major over Homebrew's unversioned Node.
path=(
  "$HOME/nvim-macos/bin"(N/)
  /opt/homebrew/opt/node@24/bin(N/)
  "$HOME/.local/bin"(N/)
  /opt/homebrew/bin(N/)
  /opt/homebrew/sbin(N/)
  "$HOME/.cargo/bin"(N/)
  "$HOME/.deno/bin"(N/)
  /usr/local/smlnj/bin(N/)
  "$path[@]"
)
if [[ -n $NVM_BIN && -x $NVM_BIN/node ]]; then
  path=("$NVM_BIN" "$path[@]")
fi

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR=nvim
