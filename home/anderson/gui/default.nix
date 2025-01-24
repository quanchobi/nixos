{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  unstable-pkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in
{
  # Enable gui programs only if machine is equipped with a gui
  imports = [
    ./firefox.nix
    ./foot.nix
    ./gnome.nix
    ./obs.nix
    ./style.nix
  ];
  home.packages = with pkgs; [
    steam
    vesktop
    ryujinx
    adwaita-icon-theme
    lunar-client
    orca-slicer # Kinda broken
    godot_4
    obsidian
  ];
}
