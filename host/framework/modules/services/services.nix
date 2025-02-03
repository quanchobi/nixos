#TODO: Refactor into individual files
{
  # Contains packages necessary for my laptops hardware
  imports = [ ];

  options = { };

  config = {
    services = {
      # Enable CUPS for printing
      printing.enable = true;

      # Enable upower to view battery stats
      upower.enable = true;

      # Enable pipewire for audio management
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
        jack.enable = true;
      };
      # Enable firmware updater
      fwupd.enable = true;

      # Configure input
      libinput.enable = true;
      xserver = {
        xkb.layout = "us";
        xkb.variant = "";
      };

      devmon.enable = true;
      gvfs.enable = true;
      udisks2.enable = true;

    };

    security.rtkit.enable = true;

    # Bluetooth
    hardware.bluetooth.enable = true;

    # Bootloader.
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      # Boot splash screen. Handled by stylix. plymouth not allowing system to boot sometimes so it has been disabled.
      # plymouth.enable = true;
      # Needs to be enabled for plymouth to handle the luks screen
    };
  };
}
