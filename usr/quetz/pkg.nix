{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    # Fun
    bottles
    heroic
    lutris
    #     nexusmods-app-unfree
    prismlauncher
    protonup-qt
    ryujinx
    scarab

    obs-studio
    tor-browser
    freecad
    jetbrains.webstorm

    #     qtcreator
    #     kdePackages.kdevelop
    #     kdePackages.full
    #     gcc
    #     gnumake
    #     cmake
    #     cmake-format
    #     qbs
    #     kdePackages.kirigami

    inputs.zen-browser.packages."${system}".default
  ];

}
