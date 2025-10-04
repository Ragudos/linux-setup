export PATH="$HOME/.local/bin:$PATH"

# Pyenv (optional, only if installed)
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# NVM (Node Version Manager)
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
fi

if [[ -d "$HOME/oh-my-zsh.sh" ]]; then
	export ZSH="$HOME/.oh-my-zsh"
	ZSH_THEME=""
	source $ZSH/oh-my-zsh.sh
	source ~/.zsh_profile
fi

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config "$XDG_CONFIG_HOME/oh-my-posh/theme.json")"
fi

