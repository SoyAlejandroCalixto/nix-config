{ inputs, ... }:
let
  dotfiles = inputs.dotfiles;
in {
  home-manager.users.kappy.home.file = {
    # Eww config
    ".config/eww/eww.yuck".source = "${dotfiles}/.config/eww/eww.yuck";
    ".config/eww/eww.scss".source = "${dotfiles}/.config/eww/eww.scss";

    # Features scripts
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
  };
}