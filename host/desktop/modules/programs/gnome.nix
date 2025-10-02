{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = false; # x11 only (nvidia)
      };
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
      seahorse
      tali # poker game
      totem # video player
    ];
  };
}
