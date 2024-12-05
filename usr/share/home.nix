{ ... }:
{
  imports = [
    ./pkg.nix
    ./sh.nix
    ./plasma.nix
    ./firefox.nix
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
      EDITOR = "\'hx\'";
      PNPM_HOME = ".local/bin";
    };
    #     shellAliases = {};

    file = {
      "scripts" = {
        source = ./scripts;
        target = ".local/share/scripts";
      };
    };
  };

  #   gtk.catppuccin = {
  # 	enable = true;
  # 	flavor = "mocha";
  # 	accent = "lavendar";
  # 	tweaks = ["rimless" "black"];
  # };
  #
  # qt.style.catppuccin = {
  # 	enable = true;
  # 	apply = true;
  # 	flavor = "mocha";
  # 	accent = "lavendar";
  # };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.11";
}
