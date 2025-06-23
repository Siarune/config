{ StateVersion, ... }:
{
  imports = [
    ./pkg.nix
    ./sh.nix
    ./plasma.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sia";
    homeDirectory = "/home/sia";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      PNPM_HOME = "/home/sia/.local/bin";
      NIXD_FLAGS = "--log=error";
      DXVK_CONFIG_FILE = "/home/sia/.config/dxvk.conf";
    };
    #     shellAliases = {};
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = StateVersion;
}
