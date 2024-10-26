{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-themes-extra
    bibata-cursors
    adwaita-qt
    adwaita-qt6
  ];

  home.file = {
    ".config/gtk-3.0/settings.ini".text = ''

      [Settings]
      gtk-application-prefer-dark-theme=1
      gtk-font-name=Inter
      gtk-cursor-theme-name=Bibata-Modern-Classic
      
    '';
  };
}