{
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
}
