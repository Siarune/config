{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    polychromatic

    # Fun
    bottles
    heroic
    lutris
    scarab
    protonup-qt
    godot_4
    #     nexusmods-app-unfree
    prismlauncher
    protonup-qt
    ryujinx
    scarab
    bottles

    obs-studio
    qbittorrent
    tor-browser
    inputs.zen-browser.packages."${system}".default
  ];

}
