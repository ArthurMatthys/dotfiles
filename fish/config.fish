# Aliases

#compdef g=git
alias g='git'

#compdef g=git
alias gcl='git clone'

#compdef g=git
alias gst='git status'

#compdef g=git
alias gc='git commit -S'

#compdef _git gst=git-status
alias gd='git diff'

#compdef _git gd=git-diff
alias gdc='git diff --cached'

#compdef _git gdc=git-diff
alias gl='git pull'

#compdef _git gl=git-pull
alias gup='git pull --rebase'

#compdef _git gup=git-fetch
alias gp='git push'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vi="nvim"
alias vim="nvim"

export MAKEFLAGS="-j16"
fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/bin
fish_add_path /usr/lib/node_modules/vscode-langservers-extracted/bin
