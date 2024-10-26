{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/.local/share/rofi/themes/rofi.rasi";
    extraConfig = {
      show-icons = true;
    };
  };

  home.file.".local/share/rofi/themes/rofi.rasi".text = ''

    * {
      font:   "CaskaydiaCove Nerd Font 14";

      bg0:    #292d34;
      fg0:    #aab3bf;
      fg1:    #FFFFFF;
      fg2:    #61afef80;
      fg3:    #61afef;

      background-color:   transparent;
      text-color:         @fg0;
      margin:     0;
      padding:    0;
      spacing:    0;
    }
    window {
      background-color:   @bg0;
      location:       center;
      width:          670;
      border-radius:  20;
      border:         3px;
      border-color:   @fg3;
    }
    inputbar {
      font:       "CaskaydiaCove Nerd Font Bold 24";
      padding:    20px;
      spacing:    20px;
      children:   [ entry ];
    }
    entry {
      font:   inherit;
      placeholder         : "???";
      placeholder-color   : @fg2;
      color:               @fg3;
    }
    message {
      border:             2px 0 0;
      border-color:       @bg0;
      background-color:   @bg0;
    }
    textbox {
      padding:    8px 24px;
    }
    listview {
      lines:      10;
      columns:    1;
      fixed-height:   false;
      border:         1px 0 0;
      border-color:   @bg0;
      margin:         0px 0px 10px 0px;
    }
    element {
      padding:            10px;
      spacing:            16px;
      margin:             0px 10px;
      border-radius:      10;
      background-color:   transparent;
    }
    element selected normal, element selected active {
      background-color:   @fg3;
      text-color:         @bg0;
    }
    element-icon {
      size:   1em;
    }
    element-text {
      text-color: inherit;
    }

  '';
}