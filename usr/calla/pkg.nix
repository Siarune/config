{ pkgs, ... }:
{

  home.packages = with pkgs; [
    lutris
    prismlauncher
    temurin-bin-21
    ryubing
    heroic

    obs-studio
    qbittorrent
    tor-browser

    sabnzbd
    sonarr
    radarr
  ];

}
