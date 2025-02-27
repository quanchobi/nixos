{ pkgs, config, ... }:
{
  imports = [ ];

  options = { };

  config = {
    services.xserver = {
      videoDrivers = [ "nvidia" ];
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ gnome-tweaks ];
    environment.gnome.excludePackages = with pkgs; [
      atomix # puzzle game
      cheese # webcam tool
      epiphany # web browser
      evince # document viewer
      geary # email reader
      gedit # text editor
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
      totem # video player
    ];

    stylix = {
      enable = true;
      image = ../../../assets/desktop.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";

      polarity = "dark";

      cursor = {
        package = pkgs.posy-cursors;
        name = "Posy_Cursor_Black";
        size = 12;
      };
    };
  };
}
