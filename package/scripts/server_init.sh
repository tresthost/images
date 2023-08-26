#!/bin/bash
# NodeJS App Installation Script
#
# Server Files: /mnt/server

apt update
apt install -y git curl jq file unzip make gcc g++ python python-dev libtool

curl -L https://unpkg.com/@pnpm/self-installer | node
curl -o- -L https://yarnpkg.com/install.sh | sh

if [ "${PACKAGE_MANAGER}" == "npm" ]; then
    echo -e "updating npm. please wait..."
    npm install npm@latest -g

    mkdir -p /mnt/server
    cd /mnt/server

    if [ "${USER_UPLOAD}" == "true" ] || [ "${USER_UPLOAD}" == "1" ]; then
        echo -e "assuming user knows what they are doing have a good day."
        exit 0
    fi

    ## add git ending if it's not on the address
    if [[ ${GIT_ADDRESS} != *.git ]]; then
        GIT_ADDRESS=${GIT_ADDRESS}.git
    fi

    if [ -z "${USERNAME}" ] && [ -z "${ACCESS_TOKEN}" ]; then
        echo -e "using anon api call"
    else
        GIT_ADDRESS="https://${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d/ -f3-)"
    fi

    ## pull git js repo
    if [ "$(ls -A /mnt/server)" ]; then
        echo -e "/mnt/server directory is not empty."
        if [ -d .git ]; then
            echo -e ".git directory exists"
            if [ -f .git/config ]; then
                echo -e "loading info from git config"
                ORIGIN=$(git config --get remote.origin.url)
            else
                echo -e "files found with no git config"
                echo -e "closing out without touching things to not break anything"
                exit 10
            fi
        fi

        if [ "${ORIGIN}" == "${GIT_ADDRESS}" ]; then
            echo "pulling latest from github"
            git pull
        fi
    else
        echo -e "/mnt/server is empty.\ncloning files into repo"
        if [ -z ${BRANCH} ]; then
            echo -e "cloning default branch"
            git clone ${GIT_ADDRESS} .
        else
            echo -e "cloning ${BRANCH}'"
            git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .
        fi

    fi

    echo "Installing nodejs packages"
    if [[ ! -z ${NODE_PACKAGES} ]]; then
        /usr/local/bin/npm install ${NODE_PACKAGES}
    fi

    if [ -f /mnt/server/package.json ]; then
        /usr/local/bin/npm install --production
    fi

    echo -e "install complete"
    exit 0
elif [ "${PACKAGE_MANAGER}" == "pnpm" ]; then
    echo -e "updating pnpm. please wait..."
    npm install pnpm@latest -g

    mkdir -p /mnt/server
    cd /mnt/server

    if [ "${USER_UPLOAD}" == "true" ] || [ "${USER_UPLOAD}" == "1" ]; then
        echo -e "assuming user knows what they are doing have a good day."
        exit 0
    fi

    ## add git ending if it's not on the address
    if [[ ${GIT_ADDRESS} != *.git ]]; then
        GIT_ADDRESS=${GIT_ADDRESS}.git
    fi

    if [ -z "${USERNAME}" ] && [ -z "${ACCESS_TOKEN}" ]; then
        echo -e "using anon api call"
    else
        GIT_ADDRESS="https://${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d/ -f3-)"
    fi

    ## pull git js repo
    if [ "$(ls -A /mnt/server)" ]; then
        echo -e "/mnt/server directory is not empty."
        if [ -d .git ]; then
            echo -e ".git directory exists"
            if [ -f .git/config ]; then
                echo -e "loading info from git config"
                ORIGIN=$(git config --get remote.origin.url)
            else
                echo -e "files found with no git config"
                echo -e "closing out without touching things to not break anything"
                exit 10
            fi
        fi

        if [ "${ORIGIN}" == "${GIT_ADDRESS}" ]; then
            echo "pulling latest from github"
            git pull
        fi
    else
        echo -e "/mnt/server is empty.\ncloning files into repo"
        if [ -z ${BRANCH} ]; then
            echo -e "cloning default branch"
            git clone ${GIT_ADDRESS} .
        else
            echo -e "cloning ${BRANCH}'"
            git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .
        fi

    fi

    echo "Installing nodejs packages"
    if [[ ! -z ${NODE_PACKAGES} ]]; then
        /usr/local/bin/pnpm install ${NODE_PACKAGES}
    fi

    if [ -f /mnt/server/package.json ]; then
        /usr/local/bin/pnpm install --production
    fi

    echo -e "install complete"
    exit 0
elif [ "${PACKAGE_MANAGER}" == "yarn" ]; then
    echo -e "updating yarn. please wait..."
    npm install yarn@latest -g

    mkdir -p /mnt/server
    cd /mnt/server

    if [ "${USER_UPLOAD}" == "true" ] || [ "${USER_UPLOAD}" == "1" ]; then
        echo -e "assuming user knows what they are doing have a good day."
        exit 0
    fi

    ## add git ending if it's not on the address
    if [[ ${GIT_ADDRESS} != *.git ]]; then
        GIT_ADDRESS=${GIT_ADDRESS}.git
    fi

    if [ -z "${USERNAME}" ] && [ -z "${ACCESS_TOKEN}" ]; then
        echo -e "using anon api call"
    else
        GIT_ADDRESS="https://${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d/ -f3-)"
    fi

    ## pull git js repo
    if [ "$(ls -A /mnt/server)" ]; then
        echo -e "/mnt/server directory is not empty."
        if [ -d .git ]; then
            echo -e ".git directory exists"
            if [ -f .git/config ]; then
                echo -e "loading info from git config"
                ORIGIN=$(git config --get remote.origin.url)
            else
                echo -e "files found with no git config"
                echo -e "closing out without touching things to not break anything"
                exit 10
            fi
        fi

        if [ "${ORIGIN}" == "${GIT_ADDRESS}" ]; then
            echo "pulling latest from github"
            git pull
        fi
    else
        echo -e "/mnt/server is empty.\ncloning files into repo"
        if [ -z ${BRANCH} ]; then
            echo -e "cloning default branch"
            git clone ${GIT_ADDRESS} .
        else
            echo -e "cloning ${BRANCH}'"
            git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .
        fi

    fi

    echo "Installing nodejs packages"
    if [[ ! -z ${NODE_PACKAGES} ]]; then
        /usr/local/bin/yarn add ${NODE_PACKAGES}
    fi

    if [ -f /mnt/server/package.json ]; then
        /usr/local/bin/yarn --production
    fi

    echo -e "install complete"
    exit 0
else
    echo -e "updating npm. please wait..."
    npm install npm@latest -g

    mkdir -p /mnt/server
    cd /mnt/server

    if [ "${USER_UPLOAD}" == "true" ] || [ "${USER_UPLOAD}" == "1" ]; then
        echo -e "assuming user knows what they are doing have a good day."
        exit 0
    fi

    ## add git ending if it's not on the address
    if [[ ${GIT_ADDRESS} != *.git ]]; then
        GIT_ADDRESS=${GIT_ADDRESS}.git
    fi

    if [ -z "${USERNAME}" ] && [ -z "${ACCESS_TOKEN}" ]; then
        echo -e "using anon api call"
    else
        GIT_ADDRESS="https://${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d/ -f3-)"
    fi

    ## pull git js repo
    if [ "$(ls -A /mnt/server)" ]; then
        echo -e "/mnt/server directory is not empty."
        if [ -d .git ]; then
            echo -e ".git directory exists"
            if [ -f .git/config ]; then
                echo -e "loading info from git config"
                ORIGIN=$(git config --get remote.origin.url)
            else
                echo -e "files found with no git config"
                echo -e "closing out without touching things to not break anything"
                exit 10
            fi
        fi

        if [ "${ORIGIN}" == "${GIT_ADDRESS}" ]; then
            echo "pulling latest from github"
            git pull
        fi
    else
        echo -e "/mnt/server is empty.\ncloning files into repo"
        if [ -z ${BRANCH} ]; then
            echo -e "cloning default branch"
            git clone ${GIT_ADDRESS} .
        else
            echo -e "cloning ${BRANCH}'"
            git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .
        fi

    fi

    echo "Installing nodejs packages"
    if [[ ! -z ${NODE_PACKAGES} ]]; then
        /usr/local/bin/npm install ${NODE_PACKAGES}
    fi

    if [ -f /mnt/server/package.json ]; then
        /usr/local/bin/npm install --production
    fi

    echo -e "install complete"
    exit 0
fi