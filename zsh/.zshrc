# Powerlevel10k instant prompt (keep this at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k theme
source "$HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"

# Plugins (standalone, NOT from OMZ)
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$HOME/.zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh"
source "$HOME/.zsh/plugins/zsh-sudo/sudo.plugin.zsh"
# Optional: add zoxide
eval "$(zoxide init zsh)"

# Optional: load your p10k config if present
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history
unsetopt prompt_sp 

# Completion styling
# autoload -Uz compinit && compinit
# zstyle ':completion:*' menu select
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Prompt for absolute paths (your style)
PROMPT='%F{cyan}%~%f ❯ '
