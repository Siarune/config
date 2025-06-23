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
        pinentry-qt
        appimage-run
        nixd
        package-version-server
        nixfmt-rfc-style
        nh
        kubo # ipfs
      ];
    };
  };

  programs.adb.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
