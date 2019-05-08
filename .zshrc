# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/anarchy/.oh-my-zsh"

ZSH_THEME="lambda" #zsh тема

plugins=(git command-time sudo) #zsh плагины

source $ZSH/oh-my-zsh.sh

neofetch

#alias
alias rep="sudo pacman -S"
alias urep="sudo pacman -Rs"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syyu"
alias aur="aurman -S"
alias start="sudo systemctl start"
alias enable="sudo systemctl enable"
alias disable="sudo systemctl disable"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias make="make -j3"
alias make-install="sudo make install"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias logs="sudo grep -i failed /var/log/* && sudo grep -i error /var/log/*"
alias e="exit"
alias l="ls"
alias c="clear"
alias la="ls -a"
alias cp="cp -v"
alias modprobe="sudo modprobe -v"
alias rm='rm -Iv --one-file-system'
alias mkinitcpio="sudo mkinitcpio -p"
alias vimrc='vim ~/.vimrc'
alias zshrc="vim ~/.zshrc"

#colour
if [ -f /usr/bin/grc ]; then
 alias gcc="grc --colour=auto gcc"
 alias irclog="grc --colour=auto irclog"
 alias log="grc --colour=auto log"
 alias netstat="grc --colour=auto netstat"
 alias ping="grc --colour=auto ping"
 alias proftpd="grc --colour=auto proftpd"
 alias traceroute="grc --colour=auto traceroute"
 alias grep="grep --color=auto"
 alias ls='ls --color=auto'
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh #подсветка синтаксиса
source /usr/share/doc/pkgfile/command-not-found.zsh #замена хука "Команда не найдена"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh #автокоррекция

#Распаковка архива
ex () {
 if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2) tar xvjf $1   ;;
     *.tar.gz)  tar xvzf $1   ;;
     *.tar.xz)  tar xvfJ $1   ;;
     *.bz2)     bunzip2 $1    ;;
     *.rar)     unrar x $1    ;;
     *.gz)      gunzip $1     ;;
     *.tar)     tar xvf $1    ;;
     *.tbz2)    tar xvjf $1   ;;
     *.tgz)     tar xvzf $1   ;;
     *.zip)     unzip $1      ;;
     *.Z)       uncompress $1 ;;
     *.7z)      7z x $1       ;;
     *)         echo "'$1' не могу распаковать ваш архив" ;;
   esac
 else
   echo "'$1' не буду распаковывать этот архив"
 fi
}

autoload -Uz compinit 
compinit
unsetopt correct_all  
setopt correct
setopt HIST_IGNORE_SPACE

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}

export PAGER='vimpager'
alias less=$PAGER

setopt extended_history #Добавляет в историю время выполнения команды.
alias history='fc -il 1'
setopt INC_APPEND_HISTORY #История становится общей между всеми сессиями / терминалами.
setopt HIST_IGNORE_ALL_DUPS # Дополнение файла истрии
setopt HIST_REDUCE_BLANKS #Добавить команду в историю не после выполнения а перед
setopt HIST_NO_STORE # Игнopupoвaть вce пoвтopeнuя команд
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
