###############################################
# Mark Nelson - Environment Setup Script
# Configures environment variables, paths, and aliases
###############################################

# ---- Detect hostname and set HOMEDIR accordingly ----
HOSTNAME=$(hostname -s)  # Get short hostname (without domain)

case "$HOSTNAME" in
  MarksMacStudio2)
    export HOMEDIR="/Volumes/Data/Users/Mark"
    ;;
  MacBook-Air-15)
    export HOMEDIR="/Users/mark"
    ;;
  *)
    echo "⚠️ Error: HOMEDIR is not set for host $HOSTNAME"
    unset HOMEDIR
    ;;
esac

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
alias ftsb='echo ftsb'

# ---- Custom prompt (commented out) ----
# PS1='[\h:$PWD] >'
# export PS1="%d %% "

# ---- PATH ----
export PATH="$SCRIPTDIR/commands:/usr/local/php5/bin:$PATH"

# ---- Completion message ----
echo " " 
echo "*****************************************************"
echo "✅ Mark Nelson - ${(%):-%N} Completed"  # $0 is the script name
echo "*****************************************************"