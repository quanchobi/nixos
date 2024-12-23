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
}
