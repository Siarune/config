{ pkgs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    lutris
    prismlauncher
    temurin-bin-8
    ryujinx

    obs-studio
    qbittorrent
    tor-browser
  ];

}
