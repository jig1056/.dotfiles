############################################################################
# Mark Nelson - Environment Setup Script
# Configures environment variables, paths, and aliases
# 09/20/2025 - Inital version
# 09/27/2025 - Chagned code use the ~/.localvars.sh to sent home directory
# the process will exit if the ~/.localvars.sh file is not found
############################################################################

# ---- Detect hostname and set HOMEDIR accordingly ----
HOSTNAME=$(hostname -s)  # Get short hostname (without domain)

if [[ -f ~/.localvars.sh ]]; then
    source ~/.localvars.sh
else
    echo "❌ ❌ ❌ Error: ~/.localvars.sh not found!" >&2
    echo "❌ ❌ ❌ HOMEDIR not set!" >&2
    echo "❌ ❌ ❌ CD to the direcotry you want to be your home direct" >&2
    echo "⚠️ Run the following command ---> echo \"export HOMEDIR=\\\"\$(pwd)\\\"\" >> ~/.localvars.sh" >&2 
    unset HOMEDIR
    return 1  # Exit the script with an error code
fi

# ---- Directories ----
SCRIPTDIR="$HOMEDIR/Scripting"        # Scripts and utilities directory
LOGDIR="$HOMEDIR/temp/logs"           # Logs directory

# ---- Command paths ----
WOLCMD="$SCRIPTDIR/commands/wolcmd"
iperf3="$SCRIPTDIR/commands/iperf3"

# ---- File listing aliases ----
alias lshead='ls -lt | head -20'        # Show 20 most recent files
alias lsld='ls -l | grep "^d"'          # List only directories
alias lsd='ls -d */'                    # Show directories only (short form)
alias lsh='ls -ld .?*'                  # Show hidden files/dirs (excluding . and ..)

# ---- Python / Pipenv ----
alias python=python3                  # Use Python 3 by default
alias prp='pipenv run python'         # Run Python inside Pipenv environment

# ---- Quick directory navigation ----
alias cdtemp='cd $HOMEDIR/temp'
alias cdremp='cd $HOMEDIR/remp'
alias cdhome='cd $HOMEDIR'
alias cdscript='cd $SCRIPTDIR'
alias cdlogs='cd $LOGDIR'
alias cdvenv='cd $HOMEDIR/.local/share/virtualenvs'
alias cddot='~/.dotfiles'

# ---- System monitoring / troubleshooting ----
alias sleepless="pmset -g assertions | egrep '(PreventUserIdleSystemSleep|PreventUserIdleDisplaySleep)'"
alias systime="last reboot | head -2; last shutdown | head -2; uptime"
alias sleeptime="pmset -g log | grep -e ' Sleep  ' -e ' Wake  '"
alias flushdns="sudo killall -HUP mDNSResponder && sudo dscacheutil -flushcache"

# ---- Directory shortcuts ----
alias b.='cd ..'
alias b..='cd ../..'
alias b...='cd ../../..'
alias cd='z'   # Override cd with z (zoxide or autojump assumed)


# ---- Miscellaneous ----
alias size='du -sh'   # Show human-readable directory size
alias srcall='source ~/.zprofile' 
alias srcenv='source ~/.setmyenv.sh'
alias psg='ps aux | grep -i '  # Case-insensitive process search
alias c='clear'                 # Clear terminal screen
alias h='history'               # Show command history
alias v='vim'                   # Use vim editor
alias vi='vim'                  # Use vim editor
alias path='echo -e ${PATH//:/\\n}'  # Display PATH variable line by line
alias p5='ping -c 5'          # Ping with 5 packets by default

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias myip='ipconfig getifaddr en0'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias myip="hostname -I | awk '{print \$1}'"
else
    alias myip='echo "Unknown OS: cannot determine IP command"'
fi

# ---- PATH ----
export PATH="$SCRIPTDIR/commands:/usr/local/php5/bin:$PATH"

# ---- Completion message ----
echo " " 
echo "*****************************************************"
echo "✅ Mark Nelson - ${(%):-%N} Completed"  # $0 is the script name
echo "*****************************************************"