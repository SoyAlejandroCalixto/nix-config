{ pkgs, ... }:
{
  users.users = {
    kappy = {
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      isNormalUser = true;
      description = "kappy";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}