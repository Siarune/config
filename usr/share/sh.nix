{
  lib,
  pkgs,
  ...
}:
{
  programs = {

    atuin = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
      settings = {
        store_failed = false;
      };
    };

    bash = {
      enable = true;
      enableCompletion = false;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;

      config = {
        hide_env_diff = true;
        load_env = true;
      };
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        keys.normal = {
          space.w = ":w";
          space.q = ":q";
          space.m = ":bn";
          space.n = ":bp";
        };
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };

      languages = {
        language-server.nixd = with pkgs.nixd; {
          command = "nixd";
        };

        language-server.typescript-language-server = with pkgs.nodePackages; {
          command = "${typescript-language-server}/bin/typescript-language-server";
          args = [
            "--stdio"
            "--tsserver-path=${typescript}/lib/node_modules/typescript/lib"
          ];
        };
      };
    };

    nushell = {
      enable = true;
      configFile.source = ./config.nu;
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;

      settings = {
        character = {
          format = "[❯ ](green bold)";
          success_symbol = "[❯ ](green bold)";
          error_symbol = "[❯ ](red bold)";
        };
        cmd_duration = {
          format = "[$duration](yellow bold)";
        };
        directory = {
          home_symbol = "";
          read_only = " ";
        };
        shell = {
          disabled = false;
          bash_indicator = "#";
          nu_indicator = "";
        };
        sudo = {
          disabled = false;
          format = "[!](sapphire bold)";
        };

        format = lib.concatStrings [
          # Line 1
          "$directory"
          "$git_branch"
          "$git_status"
          "$line_break"
          # Line 2
          "$shell"
          "$nix_shell"
          "$sudo"
          "$character"
        ];
        right_format = lib.concatStrings [
          "$cmd_duration"
        ];

      };
    };

    yazi = {
      enable = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

  };
}
