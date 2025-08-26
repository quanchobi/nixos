{ config, pkgs, ... }:
{
  services.xserver = {
    videoDrivers = [
      "nvidia"
    ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
