{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Onest" ];
        sansSerif = [ "Onest" ];
        monospace = [ "CaskaydiaCove Nerd Font" ];
      };
    };
  };

  home-manager.users.kappy.home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
