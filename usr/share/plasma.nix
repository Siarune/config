{
pkgs,
  inputs,
  ...
}:
{

  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;

    input.keyboard = {
      options = [
        "caps:escape_shifted_capslock"
      ];
      #         layouts = [
      # 			{
      # 				layout = "us";
      # 				variant = "eng";
      # 			}
      # 			{
      # 				"layout" = "us";
      # 				variant = "dvorak";
      # 			}
      #         ];
      numlockOnStartup = "on";
    };

    workspace = {
      theme = "CatppuccinMochaLavender";
#       lookAndFeel = "Catppuccin-Mocha-Lavender";
      colorScheme = "CatppuccinMochaLavender";
#       iconTheme = "Breeze";
      cursor.theme = "BeautyLine";
#       splashScreen.engine = "None";
      splashScreen.theme = "None";
      windowDecorations.library = "org.kde.kwin.aurorae";
      windowDecorations.theme = "__aurorae__svg__CatppuccinMocha-Classic";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/MilkyWay/contents/images/5120x2880.png";

      enableMiddleClickPaste = true;
      clickItemTo = "open";
    };

    kwin = {

      titlebarButtons.left = [
        "close"
        "maximize"
        "minimize"
      ];
      titlebarButtons.right = [ ];

      effects.minimization.animation = "squash";
      effects.wobblyWindows.enable = true;

      nightLight = {
        enable = true;
        mode = "location";
        location.longitude = "-82.56";
        location.latitude = "31.55";
      };
    };

    panels = [
      {
        location = "top";
        alignment = "center";
        height = 32;
        floating = false;
        hiding = "none";
        lengthMode = "fill";
        screen = "all";
        widgets = [
          # 				"org.kde.plasma.globalmenu"
          "org.kde.plasma.pager"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }

      {
        alignment = "center";
        floating = true;
        hiding = "dodgewindows";
        lengthMode = "fit";
        location = "bottom";
        screen = "all";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
        ];
      }
    ];


    file = {

      ".config/klipperrc".General = {
        SyncClipboards.value = true;
      };

    };
  };

  programs.konsole = {
    enable = true;
    defaultProfile = "sia";
    customColorSchemes = {
      CatppuccinMocha = ./catppuccin-mocha.colorscheme;
    };

    profiles.sia = {
      command = "/home/sia/.nix-profile/bin/nu";
      colorScheme = "CatppuccinMocha";
      font.name = "MonaspiceAr Nerd Font Mono";
      font.size = 12;
    };
  };

  programs.kate = {
    enable = true;
    editor = {
      font = {
        family = "MonaspiceAr Nerd Font Mono";
        # 			weight = "light";
        pointSize = 10;
      };

      brackets = {
        automaticallyAddClosing = true;
        characters = "<>(){}[]'\"`";
        flashMatching = true;
      };
      indent.showLines = true;

    };
    lsp.customServers = {
      "nix" = {
        "command" = [ "nixd" ];
        "url" = "https://github.com/nix-community-nixd";
        "highlightingModeRegex" = "^Nix$";
        "formatting.command" = "nixfmt";
      };
    };
  };

  programs.ghostwriter = {
    enable = true;
    font = {
      family = "MonaspiceAr Nerd Font Mono";
      pointSize = 12;
    };
    general.fileSaving = {
      autoSave = true;
    };
    spelling.liveSpellCheck = true;
  };

}
