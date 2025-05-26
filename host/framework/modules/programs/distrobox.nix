{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    users.groups.libvirtd.members = [ "anderson" ];
    programs.virt-manager = {
      enable = true;
    };
  };
}
