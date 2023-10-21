#!/bin/ash

# ... (Your copyright and permission notices)

# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

# Print Node.js version
printf "\033[1m\033[33mcontainer@tresthost~ \033[0mnode -v\n"
node_version=$(node -v)
echo $node_version

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED_CUSTOM_CMD=$(echo "${CUSTOM_CMD}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
PARSED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Create the .tresthost directory
mkdir -p /home/container/.tresthost
mkdir -p /home/container/.tresthost/fonts

# Path to the startup script
startup_script="/home/container/.tresthost/startup.sh"
trest_dir="/home/container/.tresthost"
fonts_dir="/home/container/.tresthost/fonts"

# Create the .tresthost directory if it doesn't exist
if [ ! -d "$trest_dir" ]; then
    mkdir -p "$trest_dir"
fi

# Check if the startup script is already downloaded
if [ -f "$startup_script" ]; then
    echo "Startup script already exists. Overwriting..."
    # Download the updated startup script and set permissions
    curl -o "$startup_script" -L https://github.com/tresthost/startup/raw/main/side/client/nodejs/startup.sh \
        && chmod +x "$startup_script"
else
    echo "Startup script does not exist. Creating..."
    # Download the startup script and set permissions
    curl -o "$startup_script" -L https://github.com/tresthost/startup/raw/main/side/client/nodejs/startup.sh \
        && chmod +x "$startup_script"
fi

if [ "$CUSTOM_FONT_LOADER" = "false" ] || [ "$CUSTOM_FONT_LOADER" = "0" ]; then
    echo "Custom font loader is enabled. Skipping..."
    # the below code gets all the font files from the https://github.com/tresthost/fonts/fonts repo
    get_fonts=$(curl -s https://api.github.com/repos/tresthost/fonts/contents/fonts | grep download_url | cut -d '"' -f 4 | grep -E ".ttf$")
    # loop through the fonts and download them
    for font in $get_fonts; do
        # get the font name
        font_name=$(echo "$font" | cut -d "/" -f 8)
        # check if the font already exists
        if [ -f "$fonts_dir/$font_name" ]; then
            echo "Font $font_name already exists. Skipping..."
        else
            echo "Font $font_name does not exist. Downloading..."
            # Download the font
            curl -o "$fonts_dir/$font_name" -L "$font"
        fi
    done
fi

# Load all .ttf (font) files from the /home/container/.tresthost/fonts/ directory
canvas_fonts_dir="/usr/share/fonts"

for font_path in /home/container/.tresthost/fonts/*.ttf; do
    if [ -f "$canvas_fonts_dir/$(basename "$font_path")" ]; then
        echo "Font $(basename "$font_path") already loaded. Skipping..."
    else
        echo "Font $(basename "$font_path") not loaded. Loading..."
        # Load the font using the canvas package
        node -e "const { registerFont } = require('canvas'); registerFont('${font_path}', { family: '$(basename "$font_path" .ttf)' });"

        echo "Font $(basename "$font_path") loaded."
    fi
done

# Print the startup message
printf "\033[1m\033[33mcontainer@tresthost~ \033[0m%s\n" "$PARSED_STARTUP"

# Create a temporary script file
TMP_SCRIPT=$(mktemp)
echo "#!/bin/ash" > "$TMP_SCRIPT"
echo "$PARSED_CUSTOM_CMD" >> "$TMP_SCRIPT"
echo "$PARSED_STARTUP" >> "$TMP_SCRIPT"
chmod +x "$TMP_SCRIPT"

# Display the command we're running in the output, and then execute the temporary script
printf "\033[1m\033[33mcontainer@tresthost~ \033[0m%s\n" "$PARSED_CUSTOM_CMD"
# Execute the temporary script
exec env "$TMP_SCRIPT"

# Clean up the temporary script
rm -f "$TMP_SCRIPT"