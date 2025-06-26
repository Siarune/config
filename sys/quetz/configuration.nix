{ ... }:
{

  imports = [
    ./hardware.nix

  ];

  hardware.openrazer = {
    enable = false; # TODO: Re-Enable when stable on new kernel
    users = [ "sia" ];
  };

  virtualisation.docker.enable = true;

}
