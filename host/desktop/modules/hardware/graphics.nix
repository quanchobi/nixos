{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [
      "nvidia"
    ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };

      open = true;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # wayland electron fix
}
