if [[ $PACKAGE_MANAGER == "npm" ]]; then
    if [[ -d .git ]] && [[ $AUTO_UPDATE == "1" ]]; then git pull; fi;
    if [[ ! -z $NODE_PACKAGES ]]; then /usr/local/bin/npm install $NODE_PACKAGES; fi;
    if [[ ! -z $UNNODE_PACKAGES ]]; then /usr/local/bin/npm uninstall $UNNODE_PACKAGES; fi;
    if [ -f /home/container/package.json ]; then /usr/local/bin/npm install; fi;
    if [[ ! -z $CUSTOM_CMD ]]; then eval "$CUSTOM_CMD"; fi;
    /usr/local/bin/node /home/container/$JS_FILE;
elif [[ $PACKAGE_MANAGER == "pnpm" ]]; then
    if [[ -d .git ]] && [[ $AUTO_UPDATE == "1" ]]; then git pull; fi;
    if [[ ! -z $NODE_PACKAGES ]]; then /usr/local/bin/pnpm install $NODE_PACKAGES; fi;
    if [[ ! -z $UNNODE_PACKAGES ]]; then /usr/local/bin/pnpm remove $UNNODE_PACKAGES; fi;
    if [ -f /home/container/package.json ]; then /usr/local/bin/pnpm install; fi;
    if [[ ! -z $CUSTOM_CMD ]]; then eval "$CUSTOM_CMD"; fi;
    /usr/local/bin/node /home/container/$JS_FILE;
elif [[ $PACKAGE_MANAGER == "yarn" ]]; then
    if [[ -d .git ]] && [[ $AUTO_UPDATE == "1" ]]; then git pull; fi;
    if [[ ! -z $NODE_PACKAGES ]]; then /usr/local/bin/yarn add $NODE_PACKAGES; fi;
    if [[ ! -z $UNNODE_PACKAGES ]]; then /usr/local/bin/yarn remove $UNNODE_PACKAGES; fi;
    if [ -f /home/container/package.json ]; then /usr/local/bin/yarn; fi;
    if [[ ! -z $CUSTOM_CMD ]]; then eval "$CUSTOM_CMD"; fi;
    /usr/local/bin/node /home/container/$JS_FILE;
else
    echo "Unsupported PACKAGE_MANAGER: $PACKAGE_MANAGER";
fi