{ pkgs, ... }:
{

  home.packages = with pkgs; [
    lutris
    prismlauncher
    temurin-bin-8
    ryujinx

    obs-studio
    qbittorrent
    tor-browser

    sabnzbd
    sonarr
    radarr
  ];

}
