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
    ./foot.nix
    ./gnome.nix
    ./obs.nix
    ./style.nix
  ];
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
    okular
    steam
    vesktop
    ryujinx
    adwaita-icon-theme
    lunar-client
    orca-slicer
    #godot3
    godot_4
    obsidian
    zoom-us
  ];
}
