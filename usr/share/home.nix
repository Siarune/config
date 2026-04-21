{ inputs, env, ... }:
{
  imports = [
    ./pkg.nix
    ./sh.nix
    ./plasma.nix
    inputs.catppuccin.homeModules.catppuccin
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = env.username;
    homeDirectory = env.home;
    sessionPath = [
      env.bin
    ];
    sessionVariables = {
      PNPM_HOME = env.bin;
      NIXD_FLAGS = "--log=error";
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/rbw/ssh-agent-socket";
      PROTON_USE_NTSYNC = 1;
    };
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
