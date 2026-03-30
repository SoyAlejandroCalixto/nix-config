{ pkgs, inputs, ... }:
let
  onest = pkgs.stdenvNoCC.mkDerivation {
    pname = "onest";
    version = "main";
    src = pkgs.fetchurl {
      url = "https://github.com/simpals/onest/raw/refs/heads/main/fonts/variable/Onest%5Bwght%5D.ttf";
      sha256 = "sha256-P6pLkFZhhJsjMuOUtC+Rtb9VdeVTxRbKqBgR6Gik1Yk=";
    };
    dontUnpack = true;
    installPhase = ''
      install -Dm444 "$src" "$out/share/fonts/truetype/Onest.ttf"
    '';
  };
in {
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  programs = { # Paquetes con una autoconfiguración útil
    hyprland.enable = true;
    nix-ld.enable = true;
  }; # Resto de paquetes
  environment.systemPackages = with pkgs; [
    brave
    bitwarden-desktop
    mpv
    nautilus
    gnome-themes-extra
    ranger
    wl-clipboard
    wtype
    discord
    pear-desktop
    socat
    pulseaudio
    rofi
    hyprpaper
    eww
    (lua.withPackages (ps: with ps; [ lgi ]))
    glib
    playerctl
    cliphist
    hyprshot
    rofimoji
    dunst
    git
    neovim
    bat
    lsd
    fzf
    p7zip
    fastfetch
    wezterm
    zoxide
    atuin
    gh
    codex
    gemini-cli
    bubblewrap
    tree
    vscode
    zsh
    bibata-cursors
    mongodb-compass
    nodejs
    gradle
    openjdk25
  ];
  fonts.packages = with pkgs; [
    onest
    nerd-fonts.caskaydia-cove
  ];
}
