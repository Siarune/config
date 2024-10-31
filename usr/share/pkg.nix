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
    nil
    nixfmt-rfc-style
    pnpm

    keepassxc
    bitwarden-desktop
    joplin-desktop

    obsidian
    thunderbird
    libreoffice-qt6-fresh
    ungoogled-chromium

    anki
  ];

  programs = {

    librewolf = {
      enable = true;
      settings = {
        "identity.fxaccounts.enabled" = true;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.downloads" = false;

        "browser.ctrlTab.sortByRecentlyUsed" = true;
      };
    };

    # firefox = {
    # package = pkgs.librewolf;
    # profiles.sia = {
    # 	isDefault = true;
    #
    # 	settings = {
    # 		"browser.ctrlTab.sortByRecentlyUsed" = true;
    # 		"identity.fxaccounts.enabled" = true;
    # 		"privacy.clearOnShutdown.history" = false;
    # 		"privacy.clearOnShutdown.downloads" = false;
    # 	};
    #
    # 	search.default = "Qwant";
    # 	search.privateDefault = "Qwant";
    # 	search.engines = {
    #
    # 		"Nix Packages" = {
    # 			urls = [{
    # 				template = "https://search.nixos.org/packages";
    # 				params = [
    # 					{ name = "type"; value = "packages"; }
    # 					{ name = "query"; value = "{searchTerms}"; }
    # 				];
    # 			}];
    #
    # 			icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    # 			definedAliases = [ "@np" ];
    # 		};
    #
    # 		"Nix Options" = {
    # 			urls = [{
    # 				template = "https://search.nixos.org/options";
    # 				params = [
    # 					{ name = "type"; value = "packages"; }
    # 					{ name = "query"; value = "{searchTerms}"; }
    # 				];
    # 			}];
    #
    # 			icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    # 			definedAliases = [ "@no" ];
    # 		};
    #
    # 		"Qwant" = {
    # 			urls = [{
    # 				template = "https://qwant.com";
    # 				params = [
    # 					{ name = "q"; value = "{searchTerms}"; }
    # 					{ name = "t"; value = "web"; }
    # 				];
    # 			}];
    #
    # # 			icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    # 			definedAliases = [ "@qw" ];
    # 		};
    # 	};
    # };
    # };

    vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "editor.defaultFormatter" = "prettier";
        "indentRainbow.indicatorStyle" = "light";
        "gitlens.currentLine.enabled" = false;
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
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
        #      enabledCustomApps = with spicePkgs.apps; [
        #       new-releases
        #      ];
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };

  };

}
