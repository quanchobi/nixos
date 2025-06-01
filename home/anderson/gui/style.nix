{ pkgs, config, ... }:
{
  imports = [ ];

  options = { };

  config = {
    stylix = {
      enable = true;
      image = ../../../assets/desktop.jpg;
      # Manually enabled tmux
      targets.tmux.enable = false;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/espresso.yaml";
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
        # TODO: this is currently written in the style of the unstable branch. Fix it to be compatible with stable.
        # emoji = [ pkgs.noto-fonts-color-emoji ];
        # monospace = [ pkgs.nerd-fonts.caskaydia-mono ];
        # serif = [ pkgs.nerd-fonts.tinos ];
        # sansSerif = [ pkgs.nerd-fonts.caskaydia-cove ];
      };
    };
  };
}
