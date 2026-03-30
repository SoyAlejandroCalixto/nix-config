{ ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
