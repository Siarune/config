{
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    zen-browser.homeModules.twilight
  ];

  home.packages = with pkgs; [
    bottom
    vesktop
    revolt-desktop

    wine
    q4wine
    #     nexusmods-app

    pnpm
    nodejs_20
    oxlint
    temurin-bin-8
    ventoy-full
    unrar
    zed-editor

    # Productivity
    anki
    bitwarden-desktop
    calibre
    krita
    libreoffice-qt6-fresh
    zotero
    pandoc
    obsidian
    mpv
    thunderbird
    ungoogled-chromium
    inputs.zen-browser.packages."${system}".default
    tidal-hifi
  ];

  programs = {
    gpg = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "siarune";
      userEmail = "aidan.sharp@siarune.dev";

      delta.enable = true;
    };

    gitui.enable = true;

    zen-browser = {
      enable = true;
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
    };

  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
    enableNushellIntegration = true;
  };

}
