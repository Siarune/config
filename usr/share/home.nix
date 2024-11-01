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

    file = {
      "scripts" = {
        source = ./scripts;
        target = ".local/share/scripts";
      };
      "userchrome" = {
			source = ./userchrome/chrome;
			target = ".mozilla/firefox/sia/chrome";
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


  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.11";
}
