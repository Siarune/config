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
