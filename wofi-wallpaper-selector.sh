#!/bin/bash
# Configuration
WALL_DIR="$HOME/Pictures/Wallpapers"
WOFI_CONFIG="$HOME/.config/wofi/config"
WOFI_STYLE="$HOME/.config/wofi/style.css"

# 1. Generate the image list
LIST=""
for img in "$WALL_DIR"/*.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
    if [ -f "$img" ]; then
        # Format: img:<path>:text:<selection_output>
        LIST+="img:$img:text:$img\n"
    fi
done

# 2. Launch Wofi
# --dmenu-parse_action is the "magic" flag that fixes your path error
SELECTED=$(echo -e "$LIST" | wofi --dmenu --allow-images \
    --dmenu-parse_action \
    -c "$WOFI_CONFIG" -s "$WOFI_STYLE" \
    --prompt "Select Wallpaper")

# Exit if nothing selected
if [ -z "$SELECTED" ]; then
    exit 0
fi

# Clean hidden characters
SELECTED=$(echo "$SELECTED" | tr -d '\n\r')

# 3. Apply Wallpaper and Colors
# Now $SELECTED is a clean path like /home/ppk/Pictures/Wallpapers/lofi.png
swww img "$SELECTED" --transition-type grow --transition-pos 0.5,0.5 --transition-duration 1
matugen image "$SELECTED"

# 4. Notify
notify-send "Theme Updated" "Wallpaper: $(basename "$SELECTED")" -i "$SELECTED"
