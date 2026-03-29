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
        ./hardware-configuration.nix
        ./modules/audio.nix
        ./modules/bootloader.nix
        ./modules/look.nix
        ./modules/graphics.nix
        ./modules/lang.nix
        ./modules/networking.nix
        ./modules/packages.nix
        ./modules/users.nix
        ./modules/shell.nix
        ./modules/dotfiles.nix
        ./modules/vscode.nix
        home-manager.nixosModules.home-manager
        { # Módulo extra inline con boilerplate
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
