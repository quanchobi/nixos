{ # Contains packages necessary for my laptops hardware

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable upower to view battery status
  services.upower.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Kanata is a service that allows rebinding keys
  services.kanata = {
    enable = true;
    keyboards = {
      main = {
        devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
	config = 
	''
	  (defsrc
	    caps)
	  (deflayermap (default-layer)
            ;; tap caps lock as escape, hold caps lock as left control
            caps (tap-hold 200 200 esc lctl))
	'';
      };
    };
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Bootloader.
  boot = {
    loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Boot splash screen. Handled by stylix. lmao buggin
    # plymouth.enable = true;
    # Needs to be enabled for plymouth to handle the luks screen
  };

}
