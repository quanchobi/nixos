{
  imports = [
    ./nix-configuration.nix
    ./wsl-configuration.nix
  ];

  config = {
    system.gui.enable = false;
  };
}