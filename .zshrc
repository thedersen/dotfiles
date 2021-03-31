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
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Enable spelling correction for commands
setopt CORRECT

# zsh-completions
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
# Initialize completion
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit
# add tab completion for some bash commands
[[ -f "$(brew --prefix)/share/zsh/site-functions/aws-console-completion.bash" ]] && source "$(brew --prefix)/share/zsh/site-functions/aws-console-completion.bash"
[[ -f "$(brew --prefix)/share/zsh/site-functions/aws-profile-completion.bash" ]] && source "$(brew --prefix)/share/zsh/site-functions/aws-profile-completion.bash"

# Load git prompt
source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[teal]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
# Allow expansion in prompt
setopt PROMPT_SUBST
# configure prompt
PROMPT='
%F{yellow}%~ %F{8}|%F{6} $(git_super_status) %F{8}| node $(node --version) | AWS_PROFILE=${AWS_PROFILE:=?}%f
%# '

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

