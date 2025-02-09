{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    freecad
    logisim-evolution

    ryujinx
    heroic
    prismlauncher
    lutris
    scarab
    protonup-qt
    #     nexusmods-app-unfree

    obs-studio

    qbittorrent
    tor-browser

    bottles

    jetbrains.webstorm

    qtcreator
    kdePackages.kdevelop
    kdePackages.full
    gcc
    gnumake
    cmake
    cmake-format
    qbs
    kdePackages.kirigami

    inputs.zen-browser.packages."${system}".default
  ];

}
