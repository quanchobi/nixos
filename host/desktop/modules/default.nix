{
  imports = [
    ./nix-configuration.nix

    ./environment
    ./hardware
    ./programs
    ./services

    ../../common/modules/gui.nix
  ];
}
