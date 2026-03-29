{ inputs, ... }:
let
  dotfiles = inputs.dotfiles;
in
{
  home-manager.users.kappy.home.file = {
    # Hyprland
    ".config/hypr/hyprland.conf".source = "${dotfiles}/.config/hypr/hyprland.conf";
    ".config/hypr/binds.conf".source = "${dotfiles}/.config/hypr/binds.conf";
    ".config/hypr/input.conf".source = "${dotfiles}/.config/hypr/input.conf";
    ".config/hypr/autostart.conf".source = "${dotfiles}/.config/hypr/autostart.conf";
    ".config/hypr/monitors.conf".source = "${dotfiles}/.config/hypr/monitors.conf";
    ".config/hypr/envVariables.conf".source = "${dotfiles}/.config/hypr/envVariables.conf";
    ".config/hypr/look.conf".source = "${dotfiles}/.config/hypr/look.conf";
    ".config/hypr/hyprpaper.conf".source = "${dotfiles}/.config/hypr/hyprpaper.conf";

    # Eww
    ".config/eww/eww.yuck".source = "${dotfiles}/.config/eww/eww.yuck";
    ".config/eww/eww.scss".source = "${dotfiles}/.config/eww/eww.scss";
    ".config/eww/scripts/workspaces-listener.lua".source = "${dotfiles}/.config/eww/scripts/workspaces-listener.lua";
    ".config/eww/scripts/ytmusic-listener.lua".source = "${dotfiles}/.config/eww/scripts/ytmusic-listener.lua";
    ".config/eww/scripts/volume-listener.sh" = {
      source = "${dotfiles}/.config/eww/scripts/volume-listener.sh";
      executable = true;
    };
    ".config/eww/scripts/get-cpu-usage.sh" = {
      source = "${dotfiles}/.config/eww/scripts/get-cpu-usage.sh";
      executable = true;
    };

    # Dunst
    ".config/dunst/dunstrc".source = "${dotfiles}/.config/dunst/dunstrc";

    # Rofi
    ".config/rofi/config.rasi".source = "${dotfiles}/.config/rofi/config.rasi";
    ".local/share/rofi/themes/rofi.rasi".source = "${dotfiles}/.local/share/rofi/themes/rofi.rasi";

    # GTK
    ".config/gtk-3.0/settings.ini".source = "${dotfiles}/.config/gtk-3.0/settings.ini";

    # Background
    ".local/share/backgrounds/bc.png".source = "${dotfiles}/.local/share/backgrounds/bc.png";

  };
}
