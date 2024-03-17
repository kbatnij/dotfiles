# Custom Aliases and Function for Bash

# Directory navigation and file management
alias cdsrc='cd $HOME/src/'
alias ll='lsd -lA'
alias ls='lsd -A'
alias l='lsd'
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ...'
alias nuke='rm -rf'
alias aliasconfig='micro $HOME/src/personal/dotfiles/mint-linux-setup/custom.aliases.sh'

# Search and Requests
alias grep='grep --color=auto'
alias curl='curl -k' # Curl ignoring SSL certificate validation
alias wget='wget -c'

# Git Aliases for Efficiency
alias pull='echo "Pulling from branch: $(git symbolic-ref --short HEAD)" && git pull origin $(git symbolic-ref --short HEAD)'
alias gfo='git fetch origin'
alias grm='git fetch origin main:main && git rebase main'
alias gri='git rebase -i main'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gss='git stash push --include-untracked'
alias gsp='git stash pop'
alias gsl='git stash list'
alias gca='git add -A && git commit -am'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gc='git clone'
alias pmerge='echo "Pulling and merging from main" && git fetch origin && git merge origin/main'
alias push='echo "Pushing to branch: $(git symbolic-ref --short HEAD)" && git push origin $(git symbolic-ref --short HEAD)'
alias gs='git status --porcelain'

# System Updates and Monitoring
alias please='sudo $(history -p !!)'
alias top='htop'
alias df='df -h' # Disk space in human-readable format
alias nslp='nslookup' # Domain name resolution

# Kubernets
alias k='kubectl'
alias kwatchp='watch -n 4 "kubectl get pods | grep"'
alias kgc='kubectl config get-contexts'
alias kuc='kubectl config use-context'
alias kcc='kubectl config current-context'
alias ked='kubectl edit deployment'
alias kgp='kubectl get pods'
alias kgpg='kubectl get pods | grep'
alias kdp='kubectl describe pod'
