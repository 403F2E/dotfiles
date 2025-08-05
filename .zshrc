# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/composer/vendor/bin/:$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/Desktop/Stuff/Projects/Flutter/flutter/bin:$PATH"
export ANDROID_HOME="$HOME/Desktop/Stuff/Projects/Flutter/Android/Sdk/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

pfzf() {
  local target
  cd /
  target=$(fzf --preview='bat --color=always {}')
  cd "$(dirname "$target")" && nvim .
}

# Set-up icons for files/directories in terminal using lsd
alias cat="bat"
alias vi="nvim"
alias v='nvim'
alias open="xdg-open"

# alias fzf="fzf --preview='bat --color=always {}' --bind 'enter:become( cd $(dirname "{}") && echo $(dirname "{}") && sleep 2 && nvim .)'"

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'


# ZSH_THEME="alanpeabody"

eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/catppuccin_mocha.omp.json)"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)


bindkey -s '^F' "pfzf\n"
bindkey "^[[4~" end-of-line
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word 
bindkey "^[[3;5~" kill-word 

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
autoload -Uz tetriscurses
setopt autocd
# source $ZSH/oh-my-zsh.sh

# check the dnf plugins commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
# pokemon-colorscripts --no-title -s -r #without fastfetch
# pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
fastfetch -c ~/.config/fastfetch/config_new.jsonc

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc


doxy() { cd ~/Desktop/Stuff/Books/Docs/ }
ru() { cd ~/Desktop/Stuff/Projects/Rust/ }
pd() { cd ~/Desktop/Stuff/Projects/Python/ }
cdir() { cd ~/Desktop/Stuff/Projects/C/ }
cpd() { cd ~/Desktop/Stuff/Projects/C++/ }
jd() { cd ~/Desktop/Stuff/Projects/Java/ }
phd() { cd ~/Desktop/Stuff/Projects/PHP/ }
wd() { cd ~/Desktop/Stuff/Projects/Web_Project/ }
home() { cd ~ }
prog() { cd ~/Desktop/Stuff/Projects/ }
leet() { cd ~/Desktop/Stuff/Projects/Leetcode/}
