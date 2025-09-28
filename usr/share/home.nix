{ StateVersion, me, ... }:
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
    username = me;
    homeDirectory = "/home/${me}";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      PNPM_HOME = "/home/${me}/.local/bin";
      NIXD_FLAGS = "--log=error";
      DXVK_CONFIG_FILE = "/home/${me}/.config/dxvk.conf";
    };
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
