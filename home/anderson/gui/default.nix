{
  pkgs,
  lib,
  config,
  ...
}:
{
  # Enable gui programs only if machine is equipped with a gui
  imports = [
    ./firefox.nix
    ./foot.nix
    ./gnome.nix
    ./obs.nix
    ./style.nix
  ];
  home.packages = [
    pkgs.steam
    pkgs.vesktop
    pkgs.ryujinx
    pkgs.adwaita-icon-theme
    pkgs.lunar-client
    pkgs.orca-slicer
  ];
}
