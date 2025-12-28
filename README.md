# wofi-wallpaper-changer
wofi menu

Hyprland Wallpaper Selector (Wofi & Rofi)
A dynamic wallpaper selection menu for Hyprland that uses Wofi (or Rofi) to browse your wallpapers, apply them with smooth transitions via swww, and automatically generate system-wide color schemes using Matagen.

✨ Features
Visual Browser: View high-quality thumbnails of your wallpapers directly in the menu [02:28].

Smooth Transitions: Leverages swww for animated wallpaper changes [02:41].

Auto-Theming: Integrates with matagen to sample colors from your new wallpaper and apply them to your borders, waybar, and terminal [05:05].

Rich Notifications: Displays a desktop notification with a preview of the selected wallpaper upon change [09:32].

🛠️ Requirements
To get this working exactly like the video, you’ll need:

hyprland: The compositor.

wofi or rofi: The menu providers (Wofi is used as the primary example) [01:07].

swww: For wallpaper displaying and transitions.

matagen: For automatic color palette generation.

yazi: (Optional) The terminal file manager used for file previews in the video [00:36].

📂 File Structure
Recommended setup for your ~/.config/ directory:

Plaintext

.config/
├── wofi/
│   ├── config          # Enable images and dmenu mode
│   └── style.css       # CSS for menu layout and Matagen colors
├── rofi/
│   └── selector.rasi   # Layout for Rofi version
└── scripts/
    └── wallpaper-sel.sh # The logic script
🚀 Quick Setup
1. Wofi Configuration [07:28]
Ensure your ~/.config/wofi/config includes:

Ini, TOML

allow_images=true
mode=dmenu
image_size=250
2. Styling [05:43]
In your style.css, import the Matagen colors to keep your menu themed:

CSS

@import "../../.cache/matagen/colors.css";

/* Your custom styles here */
3. The Script Logic
The script essentially:

Lists files in your ~/Pictures/wallpapers folder.

Passes them to Wofi/Rofi with thumbnails.

Once a selection is made, it runs:

swww img path/to/wallpaper

matagen -i path/to/wallpaper

⚖️ License
This project is licensed under the MIT License - see the LICENSE file for details.
