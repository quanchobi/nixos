# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  inputs,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    "nvidia"
    "nvidia_modeset"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4d0b6976-2da5-4a6d-8102-d611f74eac4c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8AFC-81C4";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/f1de69ee-26b3-4870-b901-d691665b2a28"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Nvidia drivers
  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Mount Samba share
  age.secrets.samba-credentials.file = ../../../secrets/samba-credentials.age;

  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/mnt/crypt" = {
    device = "//server/mediashare";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.requires=tailscaled.service,x-systemd.automount,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=30s";
      in
      [ "${automount_opts},credentials=${config.age.secrets.samba-credentials.path},uid=anderson" ];
  };

  # qmk
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];
}
