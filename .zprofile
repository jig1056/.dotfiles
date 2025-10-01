############################################################################
# Mark Nelson - .zprofile
# 09/27/2025 - Updated script to exit if .setmyenv.sh fails
############################################################################

#echo " " 
echo "*****************************************************"
echo "✅ Mark Nelson - starting ${(%):-%N}"   # $0 is the script name" 
#echo "*****************************************************"

#My custom script
#. /Volumes/Data/Users/Mark/Scripting/config/setmyenv.sh
if source ~/.setmyenv.sh; then 
    #just continue
else 
    return 1 # Exit if there was an error in the .setmyenv.sh script
fi

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

#echo " " 
#echo "*****************************************************"
echo "✅ Mark Nelson - ${(%):-%N} Completed. ~/.zshrc runs next"  # $0 is the script name
#echo "~/.zshrc runs next" 
echo "*****************************************************"
