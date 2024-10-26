{ ... }:
{

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        name = "mybar";
        modules-left = [ 
          "custom/rofi" "custom/terminal" "custom/browser"
          "custom/files" "custom/spotify" "custom/discord"
          "custom/code-editor"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [ 
          "tray" "custom/audio-slider-icon" "pulseaudio/slider"
          "custom/cpu-icon" "cpu" "custom/ram-icon"
          "memory" "battery" "battery#bat2"
          "custom/clock-icon" "clock"
        ];
        # Modules config
        "custom/audio-slider-icon" = { 
          format = ""; 
          tooltip = false; 
        };
        "custom/cpu-icon" = { 
          format = ""; 
          tooltip = false; 
        };
        "custom/ram-icon" = { 
          format = ""; 
          tooltip = false; 
        };
        "custom/clock-icon" = { 
          format = ""; 
          tooltip = false; 
        };
        "custom/rofi" = { 
          format = ""; 
          tooltip = false; 
          on-click = "rofi -show drun"; 
        };
        "custom/terminal" = { 
          format = ""; 
          tooltip = false; 
          on-click = "wezterm"; 
        };
        "custom/browser" = { 
          format = ""; 
          tooltip = false; 
          on-click = "brave"; 
        };
        "custom/files" = { 
          format = ""; 
          tooltip = false; 
          on-click = "wezterm -e ranger"; 
        };
        "custom/spotify" = { 
          format = ""; 
          tooltip = false; 
          on-click = "spotify"; 
        };
        "custom/discord" = { 
          format = ""; 
          tooltip = false; 
          on-click = "discord"; 
        };
        "custom/code-editor" = { 
          format = ""; 
          tooltip = false; 
          on-click = "code"; 
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = { 
            active = ""; 
            empty = ""; 
            default = ""; 
          };
          persistent-workspaces = {
            "DVI-D-1" = [ 1 2 3 4 5 6 7 8 9 10 ];
            "DP-1" = [ 1 2 3 4 5 6 7 8 9 10 ];
          };
        };
        "pulseaudio/slider" = { 
          min = 0; 
          max = 100; 
          orientation = "horizontal"; 
        };
        clock = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%d %b %Y}";
          tooltip = false;
        };
        cpu = { 
          format = "{usage}%"; 
          tooltip = false; 
        };
        memory = { 
          format = "{}%"; 
          tooltip = false; 
        };
        battery = {
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          # format-good = ""; 
          # format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };
        "battery#bat2" = { 
          bat = "BAT2"; 
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = { 
            default = ""; 
            performance = ""; 
            balanced = ""; 
            power-saver = ""; 
          };
        };
        network = {
          # interface = "wlp2*";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
      }
    ];

    style = ''

      * {
        margin: 0;
        padding: 0;
        border: none;
        background: none;
        box-shadow: none;
        text-shadow: none;
      }
      window#waybar {
        background-color: #292d34;
        transition-property: background-color;
        transition-duration: .5s;
        font-family: 'CaskaydiaCove Nerd Font';
        color: #ffffff;
        min-height: 28px;
        border-radius: 0 0 12px 12px;
      }
      #workspaces button {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 4px;
        color: #98c278;
        font-size: 16px;
        border-radius: 8px;
      }
      #workspaces button:hover {
        background: #545862;
      }
      #workspaces button.empty {
        font-size: 6px;
        color: #abb3be;
      }
      #workspaces button.active {
        color : #61afef;
        font-size: 16px;
      }
      #pulseaudio-slider {
        padding-right: 5px;
        background: #c7374a;
      }
      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
      }
      #pulseaudio-slider trough {
        min-height: 6px;
        min-width: 70px;
        border-radius: 999px;
        background: #292d34;
      }
      #pulseaudio-slider highlight {
        min-width: 6px;
        border-radius: 999px;
        background: #ffffff;
      }
      #custom-audio-slider-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        border-radius: 999px 0 0 999px;
        font-size: 15px;
        background: #c7374a;
      }
      #tray {
        margin-right: 8px;
      }
      #cpu {
        padding-right: 8px;
        background: #507a36;
        font-size: 15px;
        font-weight: 700;
      }
      #custom-cpu-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #507a36;
      }
      #memory {
        padding-right: 8px;
        background: #c8792e;
        font-size: 15px;
        font-weight: 700;
      }
      #custom-ram-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #c8792e;
      }
      #clock {
        padding-right: 8px;
        background: #3279de;
        font-size: 15px;
        font-weight: 700;
        border-radius: 0 0 12px 0;
      }
      #custom-clock-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #3279de;
      }
      #custom-rofi {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #e5c07b;
      }
      #custom-terminal {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }
      * {
        margin: 0;
        padding: 0;
        border: none;
        background: none;
        box-shadow: none;
        text-shadow: none;
      }
      window#waybar {
        background-color: #292d34;
        transition-property: background-color;
        transition-duration: .5s;
        font-family: 'CaskaydiaCove Nerd Font';
        color: #ffffff;
        min-height: 28px;
        border-radius: 0 0 12px 12px;
      }
      #workspaces button {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 4px;
        color: #98c278;
        font-size: 16px;
        border-radius: 8px;
      }
      #workspaces button:hover {
        background: #545862;
      }
      #workspaces button.empty {
        font-size: 6px;
        color: #abb3be;
      }
      #workspaces button.active {
        color : #61afef;
        font-size: 16px;
      }
      #pulseaudio-slider {
        padding-right: 5px;
        background: #c7374a;
      }
      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
      }
      #pulseaudio-slider trough {
        min-height: 6px;
        min-width: 70px;
        border-radius: 999px;
        background: #292d34;
      }
      #pulseaudio-slider highlight {
        min-width: 6px;
        border-radius: 999px;
        background: #ffffff;
      }
      #custom-audio-slider-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        border-radius: 999px 0 0 999px;
        font-size: 15px;
        background: #c7374a;
      }
      #tray {
        margin-right: 8px;
      }
      #cpu {
        padding-right: 8px;
        background: #507a36;
        font-size: 15px;
        font-weight: 700;
      }
      #custom-cpu-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #507a36;
      }
      #memory {
        padding-right: 8px;
        background: #c8792e;
        font-size: 15px;
        font-weight: 700;
      }
      #custom-ram-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #c8792e;
      }
      #clock {
        padding-right: 8px;
        background: #3279de;
        font-size: 15px;
        font-weight: 700;
        border-radius: 0 0 12px 0;
      }
      #custom-clock-icon {
        font-family: 'Font Awesome 6 Free Solid';
        padding: 0 8px;
        font-size: 15px;
        background: #3279de;
      }
      #custom-rofi {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #e5c07b;
      }
      #custom-terminal {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }
      #custom-browser {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #e08f6c;
      }
      #custom-files {
        font-family: 'Font Awesome 6 Free';
        font-size: 15px;
        margin-left: 12px;
        color: #61afef;
      }
      #custom-spotify {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }
      #custom-discord {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #6172ef;
      }
      #custom-code-editor {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }
      #custom-browser {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #e08f6c;
      }
      #custom-files {
        font-family: 'Font Awesome 6 Free';
        font-size: 15px;
        margin-left: 12px;
        color: #61afef;
      }
      #custom-spotify {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }
      #custom-discord {
        font-family: 'Font Awesome 6 Brands';
        font-size: 15px;
        margin-left: 12px;
        color: #6172ef;
      }
      #custom-code-editor {
        font-family: 'Font Awesome 6 Free Solid';
        font-size: 15px;
        margin-left: 12px;
        color: #98c379;
      }

    '';
  };
}