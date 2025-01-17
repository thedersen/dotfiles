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

# Allow expansion in prompt
setopt PROMPT_SUBST
function aws_prompt() {
  case "$AWS_PROFILE" in
    *-production|*-prod) echo "%K{red}%F{white}AWS_PROFILE: ${AWS_PROFILE}%f%k" ;;
    *) echo "%F{8}AWS_PROFILE: ${AWS_PROFILE:=<not set>}%f" ;;
  esac
}

function git_super_status() {
  if [[ -n "$(git rev-parse --is-inside-work-tree)" ]]; then
    echo "$(git branch | grep '\*' | cut -d ' ' -f2) $(echo $status | wc -l) changes"
  fi
}


PROMPT='
%F{yellow}%~ %F{8}|%F{6} $(git_super_status) %F{8}| node $(node --version) |%f $(aws_prompt)
%# '

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

