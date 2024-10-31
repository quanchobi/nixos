# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "ehci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.swraid = {
    enable = true;
    mdadmConf = ''
      ARRAY /dev/md/ubuntu-server:0 metadata=1.2 UUID=baf541ae:92088960:7f78756d:e4243e39
      MAILADDR quanchobi@proton.me
    '';
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4b7d2631-e9cb-496f-9426-1b5731f31e65";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/31EA-479E";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/mnt/crypt" = {
    device = "/dev/disk_array_2/lv-0";
    fsType = "btrfs";
  };
  
  boot.initrd.luks.devices."cryptraid" = {
    device = "/dev/md0";
    keyFile = "/dev/sdg";
    keyFileSize = 4096;
    fallbackToPassword = true;
    
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Enable auto update based on my flake, once weekly on Sunday at 1:00
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    dates = "Sun *-*-* 00:00:00";
    flake = "github:quanchobi/nixos";
  };
}
