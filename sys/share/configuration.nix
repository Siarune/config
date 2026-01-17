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
      inputs.millennium.overlays.default
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
      ];
      shell = pkgs.nushell;
    };
  };

  programs.adb.enable = true;

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
