# Kappy's NixOS configuration

> **Warning:** This configuration is personal and is available in this GitHub repository for backup purposes, not for the purpose of providing other users with a preconfiguration. This warning is important because this configuration defines things like for example the partition mounts according to their UUID, which obviously makes this configuration only work on my computer and has to receive some adjustments to make it work on other computers.
>
> If you still want to take over and work on this configuration, go ahead.

### Installation
* Enter these commands:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager # or any other home-manager version channel
sudo nix-channel --update
sudo nix-shell '<home-manager>' -A install

nix-shell -p git
git clone https://github.com/SoyAlejandroCalixto/nix-config.git ~/.nixos
```

* Edit the `/etc/nixos/configuration.nix` file to look something like this:

```nix
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    /home/<user>/.nixos/main.nix
  ];
  system.stateVersion = "24.05";
}
```

* Edit the `~/.config/home-manager/home.nix` file to look something like this:

```nix
{ config, pkgs, ... }:
{
  imports = [
    /home/kappy/.nixos/home-config/main.nix
  ];
  home.stateVersion = "24.05";
}
```

* Build:

```bash
home-manager switch
sudo nixos-rebuild boot --install-bootloader
```
Restart and everything should be ready.