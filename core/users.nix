{ pkgs, lib, ... }:
{
  users.users.kappy = {
    isNormalUser = true;
    description = "kappy";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  # Variables de entorno
  environment.sessionVariables = {
    GI_TYPELIB_PATH = lib.makeSearchPath "lib/girepository-1.0" [ pkgs.glib.out pkgs.playerctl ]; # Para que Lua detecte GObject
  };
}
