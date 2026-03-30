{
  description = "Kappy NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:SoyAlejandroCalixto/arch4devs/f7e612028adb9f48ee85705275a08468b9ad31f1";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, dotfiles, ... }:
  let
    system = "x86_64-linux";
    hostname = "nixos";
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; }; # Permite a los módulos heredar los inputs como parámetro

      modules = [
        home-manager.nixosModules.home-manager
        ./hardware-configuration.nix
        ./conf/shell.nix
        ./conf/vscode.nix
        ./core/audio.nix
        ./core/bootloader.nix
        ./core/graphics.nix
        ./core/lang.nix
        ./core/networking.nix
        ./core/packages.nix
        ./core/users.nix
        ./desktop/look.nix
        ./desktop/notifications.nix
        ./desktop/runner.nix
        ./desktop/topbar.nix
        ./desktop/wm.nix
        { # Módulo extra inline con boilerplate de Nix
          system.stateVersion = "25.11";
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kappy = {
              home.username = "kappy";
              home.homeDirectory = "/home/kappy";
              home.stateVersion = "25.11";
            };
          };
        }
      ];
    };
  };
}
