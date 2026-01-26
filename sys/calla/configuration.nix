{ pkgs, ... }:
{

  imports = [
    ./hardware.nix

  ];

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb_git;
  };

  virtualisation.docker.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  system.stateVersion = "25.05";

}
