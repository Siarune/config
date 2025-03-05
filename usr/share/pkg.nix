{
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    #     kdePackages.qtstyleplugin-kvantum

    # Dev tools
    docker
    marksman
    nodejs_20
    pnpm
    temurin-bin-8

    # Social
    vesktop
    revolt-desktop

    # Utils
    bottom
    mpv
    q4wine
    qbittorrent
    unrar
    ventoy-full
    wine

    # Productivity
    anki
    bitwarden-desktop
    krita
    libreoffice-qt6-fresh
    logisim-evolution
    obsidian
    thunderbird
    ungoogled-chromium
    zotero
  ];

  programs = {

    vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "editor.fontFamily" = "'MonaspiceAr Nerd Font Mono', 'monospace', monospace";
        "editor.defaultFormatter" = "prettier";
        "editor.formatOnSave" = true;
        "files.autoSave" = "afterDelay";
        "prettier.useTabs" = true;
        "prettier.tabWidth" = 4;
        "indentRainbow.indicatorStyle" = "light";
        "gitlens.currentLine.enabled" = false;
        "workbench.startupEditor" = "none";
        "git.confirmSync" = false;
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[markdown]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };

      extensions = with pkgs.vscode-extensions; [
        yoavbls.pretty-ts-errors
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        denoland.vscode-deno
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        oderwat.indent-rainbow
        eamodio.gitlens
      ];
    };

    spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          bookmark
          copyToClipboard
          fullAppDisplay
          hidePodcasts
          shuffle
        ];
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };

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

  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableNushellIntegration = true;
  };

}
