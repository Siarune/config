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
    anki
    bottom
    libreoffice-qt6-fresh
    mpv
    obsidian
    oxlint
    pnpm
    zed-editor
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

    rbw = {
      enable = true;
      settings = {
        email = "asharp@rune.nz";
        pinentry = pkgs.pinentry-qt;
      };
    };

    zen-browser = {
      enable = true;
      nativeMessagingHosts = [ ];
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
