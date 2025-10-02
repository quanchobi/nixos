{
  imports = [
    ./hardware-configuration.nix
    ./nix-configuration.nix

    ./environment
    ./programs
    ./services

    ../../common/modules/gui.nix
  ];
}
