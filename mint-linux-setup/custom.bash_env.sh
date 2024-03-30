#!/usr/bin/env bash

emojis=('😄' '🌍' '🚀' '💻' '📘' '🔥' '🎉' '🚴' '🎨' '🧠')
rand=$[$RANDOM % ${#emojis[@]}]
echo -e "Welcome back, ${emojis[$rand]}"

eval "$(starship init bash)"

# Keychain
eval $(keychain --quiet --eval --agents ssh id_rsa)

source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Source custom aliases if the file exists
CUSTOM_ALIASES="$HOME/src/personal/dotfiles/mint-linux-setup/custom.aliases.sh"
if [ -f "$CUSTOM_ALIASES" ]; then
    source "$CUSTOM_ALIASES"
else
    echo "Custom aliases file not found: $CUSTOM_ALIASES"
fi

# Source custom functions as aliases if the file exists
CUSTOM_FUNCTIONS_AS_ALIASES="$HOME/src/personal/dotfiles/mint-linux-setup/custom.functions_as_aliases.sh"
if [ -f "$CUSTOM_FUNCTIONS_AS_ALIASES" ]; then
    source "$CUSTOM_FUNCTIONS_AS_ALIASES"
else
    echo "Custom aliases file not found: $CUSTOM_FUNCTIONS_AS_ALIASES"
fi

# bat
export BAT_THEME="Dracula"
export BAT_STYLE="numbers,grid"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# go
# Modern go uses `go env GOPATH` and `go env GOROOT` to find the folders. I'm setting GOPATH here explicitly just cuz
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# jEnv
export PATH=$PATH:$HOME/.jenv/bin
eval "$(jenv init -)" &> /dev/null
jenv enable-plugin export &> /dev/null


