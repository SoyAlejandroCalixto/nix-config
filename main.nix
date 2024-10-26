{ ... }:
{
  imports = [
    ./system/bootloader.nix
    ./system/desktop.nix
    ./system/disks.nix
    ./system/graphics.nix
    ./system/kernel.nix
    ./system/locale.nix
    ./system/networking.nix
    ./system/sound.nix
    ./system/sys-packages.nix
    ./system/users.nix
  ];
}