{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  services.cloudflare-warp.enable = true;
}
