alias pi-up="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo rpi-update && sudo apt-get autoclean && sudo apt-get clean"

alias update="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoclean && sudo apt-get clean"

alias gohome="cd ~"

# Alias definitions
# some more ls aliases
alias ll='ls -lF'
alias la='ls -aF'
alias lla='ls -laF'
alias l='ls -CF'
alias ld='ls -al -d * | egrep "^d"' # only subdirectories
alias lt='ls -alt | head -20' # recently changed files
alias ag="alias | $grep"

# convenience redefinitions
alias cd..='cd ..'
alias cd-='cd -'
alias dselect='dselect --expert'
alias fg-='fg -'
alias more="less -e"
alias lsdevs="sudo lsof | $grep /dev"
alias md='mkdir -p'
alias rd=rmdir
alias ..='cd ..'
alias ...='cd ../..'
#also remember popd
alias +='pushd .'
alias mvsafe="mv -i"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# inventions
alias fgg=jobs
alias ghist='history|grep'
alias lf='find -type f|sort'
alias load='cat /proc/loadavg'
alias meminfo='cat /proc/meminfo'

# Kalendar
alias kal='clear;echo -n "Heutiges Datum: ";date;echo;cal -3m'

#make tree a little cooler looking.
alias tree="tree -CAFa -I 'CVS|rhel.*.*.package|.svn|.git' --dirsfirst"

alias processes="ps axMuc | egrep '^[a-zA-Z0-9]'"

# command-line perl prog
alias pie="perl -p -i -e "

################## Begin functions from http://www.johnlawrence.net/code/?f=sfbashrc ###################################

# directory tree - http://www.shell-fu.org/lister.php?id=209
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

#calendar with today highlighted - http://www.shell-fu.org/lister.php?id=210
alias tcal='cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed '\''s/./#/g'\'') /"'

# count files by type - http://www.shell-fu.org/lister.php?id=173
alias ftype='find ${*-.} -type f | xargs file | awk -F, '\''{print $1}'\'' | awk '\''{$1=NULL;print $0}'\'' | sort | uniq -c | sort -nr'

# convert permissions to octal - http://www.shell-fu.org/lister.php?id=205
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g''

# portscan in one line - http://www.shell-fu.org/lister.php?id=295
portscan(){
  HOST="$1";for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}

# print a random shell-fu tip - http://www.shell-fu.org/lister.php?id=192
alias shell-fu='links -dump "http://www.shell-fu.org/lister.php?random" | grep -A 100 -- ----'

# get an ordered list of subdirectory sizes - http://www.shell-fu.org/lister.php?id=275
alias dux='du -sk ./* | sort -n | awk '\''BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'\'''

# share current tree over the web - http://www.shell-fu.org/lister.php?id=54
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'

################## End functions from http://www.johnlawrence.net/code/?f=sfbashrc ###################################
