{
  lib,
  pkgs,
  ...
}:
{
  programs = {

    bash = {

      enable = true;
      enableCompletion = false;
    };

    nushell = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        "nhb" = "nh os build /etc/nixos";
        "nhs" = "nh os switch /etc/nixos";
        "nht" = "nh os test /etc/nixos";
        "nhu" = "nh os switch -u /etc/nixos";
      };
      extraConfig = ''
            $env.config = {
            	show_banner: false

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
            	{
            		name: go_prev_directory
            		modifier: control
            		keycode: char_z
            		mode: [emacs, vi_insert]
            		event: {
            			send: executehostcommand,
            			cmd: "z -"
            		}
            	}
            	{
            		name: go_home_directory
             		modifier: alt
              		keycode: char_z
               		mode: [emacs, vi_insert]
                	event: {
               			send: executehostcommand,
                  		cmd: "z ~"
            		}
            	}
             	]
        	}
      '';
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

        sudo = {
          disabled = false;
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
          disabled = false;
          bash_indicator = "#";
          nu_indicator = "";
        };
      };
    };

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

    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        keys.normal = {
          space.w = ":w";
          space.q = ":q";
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

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

  };
}
