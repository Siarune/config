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
	pinentry-qt
	appimage-run
	polychromatic

	heroic
	prismlauncher
	discord
	vesktop
	lutris
	wine
	q4wine
	ryujinx
	nexusmods-app

	nodejs_20
	temurin-bin-8
	nil
	pnpm
	docker
	ventoy-full
	unrar



	anki
	bitwarden-desktop
# 	calibre
# 	kdePackages.falkon
	krita
	freecad
	libreoffice-qt6-fresh
# 	nextcloud-client
	joplin-desktop
	mpv
	obsidian
	thunderbird
	ungoogled-chromium
	qbittorrent
# 	kdePackages.kdevelop
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
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
        #      enabledCustomApps = with spicePkgs.apps; [
        #       new-releases
        #      ];
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
# 		signing = {
# 			signByDefault = true;
# # 			key = "0xD65110839D02609F";
#             key = null;
# 		};

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
