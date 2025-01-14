{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ gnome-tweaks ];

  stylix = {
    enable = true;
    image = ../../../assets/desktop.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
 
    polarity = "dark";
 
    cursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Black";
    };
  };
}
