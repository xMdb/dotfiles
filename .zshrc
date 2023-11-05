# Export GPG thingy
export GPG_TTY=$(tty)

alias lsd="dir ~/dockersetups/"
alias ll="ls -la"

es() {
  nano ~/dockersetups/$1/docker-compose.yml
}

up() {
  docker-compose -f ~/dockersetups/$1/docker-compose.yml up -d
}

down() {
  docker-compose -f ~/dockersetups/$1/docker-compose.yml down
}

drips() {
  docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /'
}

mdd() {
  sudo mkdir -p /opt/docker/data/$1
}

msd() {
  mkdir -p ~/dockersetups/$1
}

listports() {
  sudo netstat -ntlp | grep LISTEN
}

updatedockerimage() {
  docker pull $(grep 'image' ~/dockersetups/$1/docker_compose.yml | awk '{print $2}')
  docker stop $(grep 'container_name' ~/dockersetups/$1/docker_compose.yml | awk '{print $2}')
  docker rm $(grep 'container_name' ~/dockersetups/$1/docker_compose.yml | awk '{print $2}')
  up $1
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
