{
  description = "Sia's NixOS configuration";
  inputs = {
    # Catppuccin colors
    catppuccin.url = "github:catppuccin/nix/release-25.05";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Steam homebrew
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

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
      chaotic,
      home-manager,
      catppuccin,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      StateVersion = "25.05";
    in
    {
      nixosConfigurations = {

        Calla = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs StateVersion;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/calla/configuration.nix
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.nyx-cache
            chaotic.nixosModules.nyx-overlay
            chaotic.nixosModules.nyx-registry
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs StateVersion;
                };
                backupFileExtension = "bak";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/calla/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
            }
          ];
        };

        Flint = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs StateVersion;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/flint/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs StateVersion;
                };
                backupFileExtension = "bak";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/flint/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
            }
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

    };

}
