{ pkgs, ... }:

{
#  stylix = {
#    enable = true;
#    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
#    image = ./kanagawa.jpg;
#  };

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
}
