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
      shellAliases = {
        ".." = "cd ..";
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
             	{
              		name: nix_build
                	modifier: control
                 	keycode: char_b
                  	mode: [emacs, vi_insert]
                  	event: {
                   		send: executehostcommand,
                 		cmd: "nh os build"
                   }
                }
                {
                	name: nix_switch
                  	modifier: control
                   	keycode: char_s
                    	mode: [emacs, vi_insert]
                    	event: {
                     		send: executehostcommand,
                   		cmd: "nh os switch"
                     }
                  }
                  {
                  		name: nix_test
                    	modifier: control
                     	keycode: char_t
                      	mode: [emacs, vi_insert]
                      	event: {
                       		send: executehostcommand,
                     		cmd: "nh os test"
                       }
                    }
                    {
                    	name: nix_upgrade
                      	modifier: control
                       	keycode: char_u
                        	mode: [emacs, vi_insert]
                        	event: {
                         		send: executehostcommand,
                       		cmd: "nh os switch -u"
                         }
                    }
                    {
                    	name: nix_clean
                      	modifier: control
                       	keycode: char_g
                        	mode: [emacs, vi_insert]
                        	event: {
                         		send: executehostcommand,
                       		cmd: "nh clean all"
                         }
                    }
                    {
                    	name: yazi
                      	modifier: alt
                       	keycode: char_y
                        	mode: [emacs, vi_insert]
                        	event: {
                         		send: executehostcommand,
                       		cmd: "yy"
                         }
                    }
                    {
                    	name: helix
                      	modifier: alt
                       	keycode: char_i
                        	mode: [emacs, vi_insert]
                        	event: {
                         		send: executehostcommand,
                       		cmd: "hx"
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
