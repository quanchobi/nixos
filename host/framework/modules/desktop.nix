{ config, pkgs, ... }:
{
  # Logging in from tty, display manager is unnecessary.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };
  services.hypridle.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Stylix themes the entire nix system
  stylix = {
    enable = true;
    image = ../../../assets/desktop.jpg;

    polarity = "dark";

    cursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Black";
    };
  };
}
