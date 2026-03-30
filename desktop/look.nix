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

  home-manager.users.kappy.gtk = {
    gtk3.enable = true;
    gtk4.enable = true;
    gtk3.font.name = "onest";
    gtk4.font.name = "onest";
    gtk3.colorScheme = "dark";
    gtk4.colorScheme = "dark";
  };
}
