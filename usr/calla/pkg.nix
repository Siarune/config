{ pkgs, ... }:
{

  home.packages = with pkgs; [
    calibre
    freecad
    grayjay
    inkscape
    krita
    lutris
    obs-studio
    tor-browser
  ];

}
