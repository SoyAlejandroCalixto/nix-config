{ inputs, ... }:
let
  dotfiles = inputs.dotfiles;
in {
  home-manager.users.kappy.home.file = {
    # Hyprland config
    ".config/hypr/hyprland.conf".source = "${dotfiles}/.config/hypr/hyprland.conf";
    ".config/hypr/binds.conf".source = "${dotfiles}/.config/hypr/binds.conf";
    ".config/hypr/input.conf".source = "${dotfiles}/.config/hypr/input.conf";
    ".config/hypr/autostart.conf".source = "${dotfiles}/.config/hypr/autostart.conf";
    ".config/hypr/monitors.conf".source = "${dotfiles}/.config/hypr/monitors.conf";
    ".config/hypr/envVariables.conf".source = "${dotfiles}/.config/hypr/envVariables.conf";
    ".config/hypr/look.conf".source = "${dotfiles}/.config/hypr/look.conf";
    ".config/hypr/hyprpaper.conf".source = "${dotfiles}/.config/hypr/hyprpaper.conf";

    # Background
    ".local/share/backgrounds/bc.png".source = "${dotfiles}/.local/share/backgrounds/bc.png";
  };
}