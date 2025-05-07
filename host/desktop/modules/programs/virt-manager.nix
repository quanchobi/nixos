{
  users.groups.libvirtd.members = [ "anderson" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  programs.virt-manager = {
    enable = true;
  };
}
