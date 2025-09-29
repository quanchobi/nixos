{ pkgs, config, ... }:
{
  imports = [ ];

  options = { };

  config = {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      videoDrivers = [ "amdgpu" ];
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ gnome-tweaks ];
    # TODO: remove unwanted gnome packages

    stylix = {
      enable = true;
      targets.qt.enable = false; # see: https://github.com/NixOS/nixpkgs/issues/416914

      polarity = "dark";

      cursor = {
        package = pkgs.posy-cursors;
        name = "Posy_Cursor_Black";
        size = 16;
      };
    };
  };
}
