{
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    zen-browser.homeModules.beta
  ];

  home.packages = with pkgs; [
    bottom
    vesktop
    revolt-desktop

    pnpm
    nodejs
    oxlint
    unrar
    zed-editor

    # Productivity
    anki
    calibre
    krita
    libreoffice-qt6-fresh
    zotero
    obsidian
    mpv
    ungoogled-chromium
    firefoxpwa
    bitwarden-desktop
  ];

  programs = {

    gpg = {
      enable = true;
    };

    git = {
      enable = true;
      settings = {
        user.name = "siarune";
        user.email = "sia@rune.nz";
      };
      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB71Rii0ysJ8MnvC0BMbU/uFegBnbqH3GNkFwc/XfKPx";
        signByDefault = true;
      };
    };

    delta.enable = true;
    gitui.enable = true;

    zen-browser = {
      enable = true;
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
      policies = {
        DisableAppUpdate = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        AutofillCreditCardEnabled = false;
      };
    };

  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
    enableNushellIntegration = true;
  };

}
