{ ... }:
{

  services.hardware.openrgb = {
    enable = true;
  };

  virtualisation.docker.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

}
