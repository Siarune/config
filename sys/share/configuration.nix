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

        # yt6801p = final.yt6801 {
        #   url = "https://github.com/h4rm00n/yt6801-linux-driver/archive/refs/heads/main.zip";
        #   sha256 = "";
        # };

        yt6801 = prev.yt6801.overrideAttrs (old: {
          src = prev.fetchFromGitHub {
            owner = "h4rm00n";
            repo = "yt6801-linux-driver";
            rev = "36bfc255f1ad7fc1796652612a4f10e7487d4c82";
            hash = "";
          };
        });
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
      shell = pkgs.nushell;
    };
  };

  programs.adb.enable = true;

  programs.steam = {
    enable = true;
    package = pkgs.steam-millennium;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
