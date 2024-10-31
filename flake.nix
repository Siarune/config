{
  description = "Sia's NixOS configuration";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Catppuccin colors
    # 	catppuccin.url = "github:catppuccin/nix";

    # Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Spotify with *spice*
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      spicetify-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {

        Gar = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/gar/hardware.nix
            home-manager.nixosModules.home-manager

            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                };
                backupFileExtension = "bk";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/gar/home.nix
                ];
              };
            }
          ];
        };
        Quetz = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./sys/share/configuration.nix
            ./sys/quetz/hardware.nix
            home-manager.nixosModules.home-manager

            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                };
                backupFileExtension = "bk";
                users.sia.imports = [
                  ./usr/share/home.nix
                  ./usr/quetz/home.nix
                ];
              };
            }
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

    };

}
