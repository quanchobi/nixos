{ lib, config, ... }:
{
  imports = [ ];

  options = { };

  config = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = lib.mkForce "IntoneMono Nerd Font:size=14";
        };

        csd = {
          preferred = "none";
        };

        # Handled by stylix
        #colors = {
        #  foreground = "dcd7ba";
        #  background = "262626";

        #  selection-foreground = "c8c093";
        #  selection-background = "2d4f67";

        #  regular0 = "090618";
        #  regular1 = "c34043";
        #  regular2 = "76946a";
        #  regular3 = "c0a36e";
        #  regular4 = "7e9cd8";
        #  regular5 = "957fb8";
        #  regular6 = "6a9589";
        #  regular7 = "c8c093";

        #  bright0  = "727169";
        #  bright1  = "e82424";
        #  bright2  = "98bb6c";
        #  bright3  = "e6c384";
        #  bright4  = "7fb4ca";
        #  bright5  = "938aa9";
        #  bright6  = "7aa89f";
        #  bright7  = "dcd7ba";
        #};
      };
    };
  };
}
