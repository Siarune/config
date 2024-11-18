{ ... }:
{

  imports = [
    ./pkg.nix
  ];

  programs.git.signing = {
    signByDefault = true;
    key = "0xD65110839D02609F";
    #             key = null;
  };
}
