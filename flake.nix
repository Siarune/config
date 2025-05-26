{
  description = "Sia's NixOS configuration";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Catppuccin colors
    catppuccin.url = "github:catppuccin/nix";

    # Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      plasma-manager,
      zen-browser,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      StateVersion = "25.05";
    in
    {
      nixosConfigurations = {

        Quetz = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs StateVersion;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/quetz/configuration.nix
            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin

            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs StateVersion;
                };
                backupFileExtension = "bak";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/quetz/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
            }
          ];
        };

        Flint = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/flint/configuration.nix
            home-manager.nixosModules.home-manager

            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                };
                backupFileExtension = "bak";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/flint/home.nix
                ];
              };
            }
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

    };

}
