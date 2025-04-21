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
    godot_4
    #     nexusmods-app-unfree
    bottles

    obs-studio
    qbittorrent
    tor-browser
    inputs.zen-browser.packages."${system}".default
  ];

}
