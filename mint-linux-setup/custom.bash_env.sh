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
