# NVM / Node.js
export NVM_DIR="/Users/john/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
NP=$(which node)
BP=${NP%bin/node} #this replaces the string '/bin/node'
LP="${BP}lib/node_modules"
export NODE_PATH="$LP";
