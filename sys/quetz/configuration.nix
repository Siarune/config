{ ... }:
{

  imports = [
    ./hardware.nix

  ];

  services.hardware.openrgb = {
    enable = true;
  };

  virtualisation.docker.enable = true;

}
