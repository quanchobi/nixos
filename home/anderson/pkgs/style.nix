{ pkgs, ... }:

{
  stylix = {
    enable = true;
#    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    image = ../../../assets/desktop.jpg;
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    cursorTheme = {
      package = pkgs.posy-cursors;
      name = "Posy Cursor Black";
      size = 16;
    };
  };
  #pkgs.nerd-fonts.droid-sans-mono
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
#      emoji = [ pkgs.noto-fonts-color-emoji ];
#      monospace = [ pkgs.nerd-fonts.caskaydia-mono ];
#      serif = [ pkgs.nerd-fonts.tinos ];
#      sansSerif = [ pkgs.nerd-fonts.caskaydia-cove ];
    };
  };
}

