{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [
      "nvidia"
    ];
  };

  # Shouldn't be necessary.
  boot.kernelParams = [
    "nvidia_drm.modeset=1"
  ];

  programs.xwayland.enable = true;

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
}
