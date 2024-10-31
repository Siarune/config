{lib, ...}: {

programs = {

    nushell = {
        enable = true;
        shellAliases = {
        ".." = "cd ..";
        "vi" = "nvim";
        };
        extraConfig = ''

       let mocha = {
    rosewater: "#f5e0dc"
    flamingo: "#f2cdcd"
    pink: "#f5c2e7"
    mauve: "#cba6f7"
    red: "#f38ba8"
    maroon: "#eba0ac"
    peach: "#fab387"
    yellow: "#f9e2af"
    green: "#a6e3a1"
    teal: "#94e2d5"
    sky: "#89dceb"
    sapphire: "#74c7ec"
    blue: "#89b4fa"
    lavender: "#b4befe"
    text: "#cdd6f4"
    subtext1: "#bac2de"
    subtext0: "#a6adc8"
    overlay2: "#9399b2"
    overlay1: "#7f849c"
    overlay0: "#6c7086"
    surface2: "#585b70"
    surface1: "#45475a"
    surface0: "#313244"
    base: "#1e1e2e"
    mantle: "#181825"
    crust: "#11111b"
  }

  let catppuccin = {
  separator: $mocha.overlay0
  leading_trailing_space_bg: $mocha.overlay0
  header: $mocha.green
  date: $mocha.mauve
  filesize: $mocha.blue
  row_index: $mocha.pink
  bool: $mocha.peach
  int: $mocha.peach
  duration: $mocha.peach
  range: $mocha.peach
  float: $mocha.peach
  string: $mocha.green
  nothing: $mocha.peach
  binary: $mocha.peach
  cellpath: $mocha.peach
  hints: dark_gray

  shape_garbage: { fg: $mocha.crust bg: $mocha.red attr: b }
  shape_bool: $mocha.blue
  shape_int: { fg: $mocha.mauve attr: b}
  shape_float: { fg: $mocha.mauve attr: b}
  shape_range: { fg: $mocha.yellow attr: b}
  shape_internalcall: { fg: $mocha.blue attr: b}
  shape_external: { fg: $mocha.blue attr: b}
  shape_externalarg: $mocha.text
  shape_literal: $mocha.blue
  shape_operator: $mocha.yellow
  shape_signature: { fg: $mocha.green attr: b}
  shape_string: $mocha.green
  shape_filepath: $mocha.yellow
  shape_globpattern: { fg: $mocha.blue attr: b}
  shape_variable: $mocha.text
  shape_flag: { fg: $mocha.blue attr: b}
  shape_custom: {attr: b}
}


        $env.config = {
            show_banner: false
            color_config: $catppuccin

            keybindings: [
                {
                    name: Clear
                    modifier: control
                    keycode: char_x
                    mode: [emacs, vi_normal, vi_insert]
                    event: { send: clearscreen }
                }
                {
                    name: delete_one_word_backward
                    modifier: control
                    keycode: backspace
                    mode: [emacs, vi_insert]
                    event: { edit: backspaceword }
                }
            ]
        }

        source /home/sia/.local/share/scripts/nix-build.nu
        '';

    };

    starship = {
        enable = true;
        enableNushellIntegration = true;
#         catppuccin.enable = true;

        settings = {

        palettes.catppuccin = {
            rosewater = "#f5e0dc";
            flamingo = "#f2cdcd";
            pink = "#f5c2e7";
            mauve = "#cba6f7";
            red = "#f38ba8";
            maroon = "#eba0ac";
            peach = "#fab387";
            yellow = "#f9e2af";
            green = "#a6e3a1";
            teal = "#94e2d5";
            sky = "#89dceb";
            sapphire = "#74c7ec";
            blue = "#89b4fa";
            lavender = "#b4befe";
            text = "#cdd6f4";
            subtext1 = "#bac2de";
            subtext0 = "#a6adc8";
            overlay2 = "#9399b2";
            overlay1 = "#7f849c";
            overlay0 = "#6c7086";
            surface2 = "#585b70";
            surface1 = "#45475a";
            surface0 = "#313244";
            base = "#1e1e2e";
            mantle = "#181825";
            crust = "#11111b";
        };
        palette = "catppuccin";

        character = {
            format = "[❯ ](green bold)";
            success_symbol = "[❯ ](green bold)";
            error_symbol = "[❯ ](red bold)";
        };

        sudo = {
            format = "[!](sapphire bold)";
        };

        directory = {
            home_symbol = "";
            read_only = " ";
        };

        cmd_duration = {
            format = "[$duration](yellow bold)";
        };

        format = lib.concatStrings [
            "$directory"
            "$git_branch"
            "$git_status"
            "$line_break"
            "$shell"
            "$nix_shell"
            "$sudo"
            "$character"
        ];

        right_format = lib.concatStrings [
            "$cmd_duration"
        ];

        shell = {
            bash_indicator = "󱆃";
            nu_indicator = "";
        };
        };
    };

    atuin = {
        enable = true;
        enableNushellIntegration = true;
        flags = [
            "--disable-up-arrow"
        ];
        settings = {
#             store_failed = false;
        };
    };

    zoxide = {
        enable = true;
        enableNushellIntegration = true;
    };

};}
