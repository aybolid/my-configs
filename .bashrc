# .bashrc

# fzf
source /usr/share/fzf/shell/key-bindings.bash

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_AVD_HOME=$HOME/.var/app/com.google.AndroidStudio/config/.android/avd

# go
export PATH=$PATH:/usr/local/go/bin

# Custom aliases
### apps
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias ld="lazydocker"
### ls
alias ls="exa"
alias ll="exa -lh"
alias la="exa -alh"
alias tree="exa --tree"
### yeah yeah
alias ":wqa"="exit"
alias ":q"="exit"
alias ":wq"="exit"
alias ":qa"="exit"
### navigation
alias "~"="cd ~"
alias ".."="cd .."
### fzf
alias "view"="fzf --preview=\"bat --color=always {}\""

alias "tygo"="~/go/bin/tygo"

### Force zed use x11 alias "zed"="WAYLAND_DISPLAY='' zed"

# Custom fns
awsexport() {
  profile=${1:-"default"}
  region=${2:-"us-east-1"}

  export AWS_PROFILE=$profile
  export AWS_REGION=$region

  echo "Using AWS profile \"$AWS_PROFILE\" in region \"$AWS_REGION\""
}

# zoxide
eval "$(zoxide init --cmd cd bash)"
. "$HOME/.cargo/env"
. "/home/matth/.deno/env"
# Turso
export PATH="$PATH:/home/matth/.turso"

# pnpm
export PNPM_HOME="/home/main/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
