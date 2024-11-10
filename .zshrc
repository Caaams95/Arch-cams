# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

##########################

# Help people new to Arch
alias apt 'man pacman'
alias apt-get 'man pacman'
alias please 'sudo'
alias helpme 'echo "To print basic information about a command use tldr <command>"'

# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grubup='sudo update-grub'
alias hw='hwinfo --short'                          # Hardware Info
alias ip='ip -color'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias rmpkg='sudo pacman -Rdd'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias upd='/usr/bin/garuda-update'
alias vdir='vdir --color=auto'
alias wget='wget -c '


# Recent installed packages
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'
# alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n' $(comm -23 <(pacman -Qeq|sort) <(pacman -Qqg|sort)) | sort -r | head -20"

# alias pacman
alias pacman="sudo pacman"
alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias update="sudo pacman -Syu"
alias pacf="pacman -Ss"
alias pacq="pacman -Qe"
alias pacdel='pacman -R'

alias du="du -sh * | sort -rh "
alias df="df -hT --total -x devtmpfs -x tmpfs"

alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ll'
alias la='ls -al'

alias open='xdg-open'
alias exegol='sudo -E /home/cams/.local/bin/exegol'
export PATH="$PATH:/opt/mssql-tools/bin" sqlcmd
export PATH="$PATH:/opt/mssql-tools/bin"
