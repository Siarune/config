{
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
      # 		iconTheme = "";
      splashScreen.theme = "none";
      windowDecorations.library = "org.kde.kwin.aurorae";
      windowDecorations.theme = "__aurorae__svg__CatppuccinMocha-Classic";
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
  };

}
