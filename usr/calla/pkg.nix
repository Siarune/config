{ pkgs, ... }:
{

  home.packages = with pkgs; [
    lutris
    ryubing
    grayjay

    obs-studio
    inkscape
    tor-browser
  ];

}
