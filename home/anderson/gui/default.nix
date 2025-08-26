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
  imports = [
    ./foot.nix
    ./gnome.nix
    ./obs.nix
    ./style.nix
  ];
  home.packages = with pkgs; [
    adwaita-icon-theme
    celluloid
    freecad-wayland
    inputs.zen-browser.packages."${system}".default
    kdePackages.okular
    love
    lunar-client
    obsidian
    prismlauncher
    ryujinx
    vesktop
    wl-clipboard
    zoom-us
  ];
}
