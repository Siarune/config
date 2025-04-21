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
    bottom
    vesktop

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
    obsidian
    mpv
    thunderbird
    ungoogled-chromium
    tidal-hifi
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
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "terminal.integrated.defaultLocation" = "editor";
        "terminal.integrated.stickyScroll.enabled" = true;
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[markdown]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
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
          betterGenres
          bookmark
          copyToClipboard
          fullAppDisplay
          history
          shuffle
        ];
        enabledCustomApps = with spicePkgs.apps; [
          newReleases
          localFiles
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
