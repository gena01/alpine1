#
# Gena01 .bashrc custom file
#
color_prompt=yes

source ~/git-prompt.sh
#
# Show Git status + branch in PS1 bash prompt
#
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM="auto"
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[00m\][\[\033[01;32m\]\u@\h\[\033[00m\]] \[\e[0;35m\]$(__git_ps1 "(%s) ")\[\e[0m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:$(__git_ps1 "(%s)") \w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias ll='ls -alp'
alias la='ls -A'
alias l='ls -CF'

alias v=ll
alias d='ls'
alias vi='vim'

export PAGER=less

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Custom function(s)
alpine-edge-abuild() {
	 docker run -t --rm -v "$PWD:/home/builder/package" -v "$HOME/.abuild/packages:/packages" -v "$HOME/.abuild/gena01@gmail.com-57ae9f3b.rsa.pub:/etc/apk/keys/gena01@gmail.com-57ae9f3b.rsa.pub" -e "RSA_PRIVATE_KEY_NAME=gena01@gmail.com-57ae9f3b.rsa" -e RSA_PRIVATE_KEY="$(cat ~/.abuild/gena01@gmail.com-57ae9f3b.rsa)" alpine-edge-abuild $*
}
export PATH=$PATH:$HOME/bin:
