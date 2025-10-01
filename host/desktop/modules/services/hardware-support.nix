{
  # Hardware support configuration for desktop
  config = {
    services = {
      fwupd.enable = true;
      libinput.enable = true;
      devmon.enable = true;
      gvfs.enable = true;
      udisks2.enable = true;
    };
  };
}
