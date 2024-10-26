{ pkgs, ... }:
{
  # Many of the missing desktop elements in this file (like the panel or the runner) are because they are defined user-side in home-config.

  # window/display manager ->
  services.displayManager.sddm.enable = true;

  programs.hyprland = { # hyprland conf is user-side, in -> home-config/desktop/wm.nix
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    clipse
    hyprshot
    bemoji
  ];

  # fonts ->
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      inter
      nerdfonts
      font-awesome
    ];
    
    fontconfig = {
      defaultFonts = {
        serif = [ "Inter" ];
        sansSerif = [ "Inter" ];
        monospace = [ "CaskaydiaCove Nerd Font" ];
      };
    };
  };

  # authentication agent ->
  security.polkit.enable = true;
  
  systemd.user.services.polkit-kde-auth-agent = {
    serviceConfig = {
      ExecStart = "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}