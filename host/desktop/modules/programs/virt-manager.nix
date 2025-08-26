{ pkgs, ... }:
{
  users.groups.libvirtd.members = [ "anderson" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  programs.virt-manager = {
    enable = true;
  };
}
