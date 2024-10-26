{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brave
    python3
    virtualenv
    python312Packages.requests
    nodejs
    nodePackages_latest.eas-cli
    wrangler
    bitwarden-cli
    git
    vlc
    wl-clipboard
    wtype
    ranger
    discord
    zip
    unzip
    p7zip
    nil
  ];

  programs.neovim.enable = true;
}