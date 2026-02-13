{
  inputs,
  pkgs,
  env,
  ...
}:
{
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
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = final.system;
          config.allowUnfree = true;
        };
      })
    ];
    config = {
      allowUnfree = true;
    };
  };

  users.users = {
    "${env.username}" = {
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
        unstable.stoat-desktop
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

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 1 --keep-since 3d";
    };
    flake = env.nix;
  };
}
