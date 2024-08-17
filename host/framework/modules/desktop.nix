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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    override = {
      base00 = "1f1f1f";
      base01 = "282828";
      base02 = "585858";
      base03 = "888888";
      base04 = "c8c8c8";
    };
    image = ../../../assets/desktop.jpg;

    polarity = "dark";

    cursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Black";
    };
  };
}
