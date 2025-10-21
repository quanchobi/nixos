{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      videoDrivers = [ "amdgpu" ];
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs.rocmPackages; [
        clr.icd
        clr
        rocm-runtime
        rocm-device-libs
        rocm-smi
      ];
    };

    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [
      gnome-tweaks
      clinfo
      rocmPackages.rocm-smi
      rocmPackages.rocminfo
    ];
  };
}
