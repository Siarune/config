{ ... }:
{

  imports = [
    # 		./pkg.nix
  ];

  programs.git.signing = {
    signByDefault = true;
    key = "0x3DC97510EAABDF50";
    #             key = null;
  };

}
