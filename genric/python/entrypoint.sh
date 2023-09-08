#!/bin/ash

#
# Copyright (c) 2021 Matthew Penner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

# Print Python version
printf "\033[1m\033[33mcontainer@tresthost~ \033[0mpython --version\n"
python --version

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Path to the startup script
startup_script="/home/container/.core/startup.sh"

# Create the .core directory
mkdir -p /home/container/.core

# Check if the startup script is already downloaded
if [ -f "$startup_script" ]; then
    echo "Startup script already exists. Overwriting..."
    # Download the updated startup script and set permissions
    curl -o "$startup_script" -L https://github.com/tresthost/startup/raw/main/side/client/python/startup.sh \
        && chmod +x "$startup_script"
else
    echo "Startup script does not exist. Creating..."
    # Download the startup script and set permissions
    curl -o "$startup_script" -L https://github.com/tresthost/startup/raw/main/side/client/python/startup.sh \
        && chmod +x "$startup_script"
fi

# Display the command we're running in the output, and then execute it with the env
# from the container itself.
printf "\033[1m\033[33mcontainer@tresthost~ \033[0m%s\n" "${PARSED}"
# shellcheck disable=SC2086
eval "${PARSED}"