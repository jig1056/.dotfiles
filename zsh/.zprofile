############################################################################
# Mark Nelson - .zprofile
# 09/27/2025 - Updated script to exit if .setmyenv.sh fails
# 09/30/2025 - Add if statement to check for darwin OS type before running brew shellenv
# 01/07/2026 - Added legacy customSetEnv.sh sourcing
# 01/10/2026 - Add $HOME/.local/bin to PATH
# 01/15/2026 - Add new strucure to source env_core, env_aliases, env_docker, env_git
# 01/16/2026 - Made ENV_SCRIPTS_DIR dynamic based on OS type
############################################################################

#echo " " 
echo "*****************************************************"
echo "✅ Mark Nelson - starting ${(%):-%N}"   # $0 is the script name" 
#echo "*****************************************************"

# #Check if my legecy customSetEnv.sh file exists, and source it if it does
# [[ -f ~/mylib/customSetEnv.sh ]] && source ~/mylib/customSetEnv.sh

# #. /Volumes/Data/Users/Mark/Scripting/config/setmyenv.sh
# # Source the .setmyenv.sh script and handle errors
# if source ~/.setmyenv.sh; then
#     #just continue
# else
#     return 1 # Exit if there was an error in the .setmyenv.sh script
# fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ENV_SCRIPTS_DIR=~/shell/linux_environment
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ENV_SCRIPTS_DIR=~/shell/shared_shell_scripts/linux_environment
fi

source $ENV_SCRIPTS_DIR/env_core.sh
source $ENV_SCRIPTS_DIR/env_aliases.sh
source $ENV_SCRIPTS_DIR/env_docker.sh
source $ENV_SCRIPTS_DIR/env_git.sh

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

PATH="$HOME/scripts:$PATH"   
PATH="$HOME/scripts/shared_shell_scripts/general:$PATH"   
export PATH

if [[ "$OSTYPE" == "darwin"* ]]; then    
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#echo " " 
#echo "*****************************************************"
echo "✅ Mark Nelson - ${(%):-%N} Completed. ~/.zshrc runs next"  # $0 is the script name
#echo "~/.zshrc runs next" 
echo "*****************************************************"
