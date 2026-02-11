{
  description = "Sia's NixOS configuration";
  inputs = {
    # Catppuccin colors
    catppuccin.url = "github:catppuccin/nix/release-25.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Steam homebrew
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium?dir=packages/nix";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

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
      ...
    }@inputs:
    let
      inherit (self) outputs;
      env = {
        username = "sia";
        home = "/home/${env.username}";
        bin = "${env.home}/.local/bin";
        nix = "${env.home}/.config/nixos";
        backupFileExtension = "bak";
      };
      Systems = [
        "Calla"
        "Flint"
      ];
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs Systems (
        System:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs env;
          };
          modules = [
            ./sys/share/core.nix
            ./sys/${nixpkgs.lib.strings.toLower System}/core.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs env;
                };
                users.${env.username}.imports = [
                  ./usr/share/home.nix
                  ./usr/${nixpkgs.lib.strings.toLower System}/home.nix
                ];
              };
            }
          ];
        }
      );

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

    };

}
