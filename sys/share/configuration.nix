{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./core.nix
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        catppuccin-kde-custom = final.catppuccin-kde.override {
          flavour = [ "mocha" ];
          accents = [ "lavender" ];
          winDecStyles = [ "classic" ];
        };
      })
    ];
    config = {
      allowUnfree = true;
    };
  };

  users.users = {
    sia = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        "docker"
      ];
      packages = with pkgs; [
        catppuccin-kde-custom
        #         beauty-line-icon-theme
        pinentry-qt
        appimage-run
        nixd
        nixfmt-rfc-style
        kubo # ipfs
      ];
    };
  };

  #   services.syncthing = {
  #     enable = true;
  #     user = "sia";
  #     configDir = "/home/sia/.config/syncthing";
  #     dataDir = "/home/sia/Documents";
  #     guiAddress = "127.0.0.1:8384";
  #   };

  programs.adb.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
    };
}
