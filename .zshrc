# Import stuff for work
if [ -f ~/.zsh_niche ]; then
    . ~/.zsh_niche
fi

# Kubernetes aliases
alias k='kubectl'
alias kc='kubectl config get-contexts'
alias kw='watch kubectl'

# kubectl autocomplete
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

kdecode () {
    kubectl get secret $1 -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}

# Git aliases
alias g='git'
alias gc='git commit -S -s'
alias gaa='git add -A'
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gpsup='git push -u origin $(git branch --show-current)'
alias gclean='git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'

# Other aliases
alias weather='curl wttr.in'
alias please='sudo $(fc -ln -1)'
alias code="open -b com.microsoft.VSCode" # Prevents duplicate icon issue in MacOSX dock

# Python config
export PATH="/Users/austin/Library/Python/3.10/bin:$PATH"

# Homebrew config
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Enable GPG in current terminal
export GPG_TTY=$(tty)

# Initialize rbenv
# eval "$(rbenv init - zsh)"

# Allow Go binaries to be run from anywhere.
export PATH="$HOME/go/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/austin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/austin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/austin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/austin/google-cloud-sdk/completion.zsh.inc'; fi

# Activate Starship
eval "$(starship init zsh)"

# Activate Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# NodeJS NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

