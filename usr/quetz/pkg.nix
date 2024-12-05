{ pkgs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    freecad

    ryujinx
    heroic
    prismlauncher
    lutris
    #     nexusmods-app-unfree

    obs-studio
  ];

}
