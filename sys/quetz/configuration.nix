{ ... }:
{

  imports = [
    ./hardware.nix

  ];

  hardware.openrazer = {
    enable = true;
    users = [ "sia" ];
  };

  virtualisation.docker.enable = true;

}
