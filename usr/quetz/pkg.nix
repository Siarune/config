{ pkgs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    # Fun
    bottles
    heroic
    lutris
    prismlauncher
    protonup-qt
    ryujinx
    scarab
    bottles

    obs-studio
    qbittorrent
    tor-browser
  ];

}
