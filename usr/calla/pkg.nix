{ pkgs, ... }:
{

  home.packages = with pkgs; [
    lutris
    prismlauncher
    temurin-bin-21
    ryubing

    obs-studio
    qbittorrent
    tor-browser

    sabnzbd
    sonarr
    radarr
  ];

}
