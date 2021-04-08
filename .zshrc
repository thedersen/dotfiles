# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB

# In case of the forgotten cd
setopt AUTO_CD

# Save shell history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Enable spelling correction for commands
#setopt CORRECT

# Add zsh-completions to fpath
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
# Initialize completion
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# load bashcompinit for bash completions
autoload bashcompinit && bashcompinit
# load some bash tab completions
for file in "$(brew --prefix)/etc/bash_completion.d/"{aws-console-completion.bash,aws-profile-completion.bash}; do
  [ -r "$file" ] && source "$file"
done

# Load git prompt
source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[teal]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[yellow]%}%{●%G%}"

# Allow expansion in prompt
setopt PROMPT_SUBST
# configure prompt
case "$AWS_PROFILE" in
  *-production) AWS_PROMPT="%K{red}%F{white}AWS_PROFILE: ${AWS_PROFILE}%f%k" ;;
  *) AWS_PROMPT="%F{8}AWS_PROFILE: ${AWS_PROFILE:=<not set>}%f" ;;
esac
PROMPT='
%F{yellow}%~ %F{8}|%F{6} $(git_super_status) %F{8}| node $(node --version) |%f ${AWS_PROMPT}
%# '

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# npx as default fallback command
source <(npx --shell-auto-fallback zsh)
