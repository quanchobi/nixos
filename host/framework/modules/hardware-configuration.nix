# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  options = { };

  config = {
    boot = {
      initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "thunderbolt"
        "usb_storage"
        "sd_mod"
      ];
      initrd.kernelModules = [ "amdgpu" ];
      kernelParams = [
        "quiet"
        "splash"
        "kvm-amd"
        "i2c-dev"
        "amd_pstate=active"
        "amdgpu.ppfeaturemask=0xffffffff"
        "amdgpu.sg_display=0"
        "cpufreq.default_governor=powersave"
        "initcall_blacklist=cpufreq_gov_userspace_init,cpufreq_gov_performance_init"
        "pcie_aspm=force"
        "pcie_aspm.policy=powersupersave"
      ];
      #kernelParams = ["quiet"];
      # To fix if broken, change kernelParams back to kernelModules.
      extraModulePackages = [ ];
    };

    services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/8a551343-7c61-4195-ad17-140591f4e875";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    boot.initrd.luks.devices."luks-ac051e3d-bfc6-409a-a3e6-a0c9c4894a03".device =
      "/dev/disk/by-uuid/ac051e3d-bfc6-409a-a3e6-a0c9c4894a03";

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/FD13-9562";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    swapDevices = [ ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
