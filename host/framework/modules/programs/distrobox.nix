{ ... }:
{
  imports = [ ];

  options = { };

  config = {
    virtualisation = {
      libvirtd = {
        enable = true;
        onBoot = "start";
        onShutdown = "shutdown";
      };
      spiceUSBRedirection.enable = true;
    };

    users.groups.libvirtd.members = [ "anderson" ];
    programs.virt-manager = {
      enable = true;
    };
  };
}
