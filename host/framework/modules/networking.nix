{ config, pkgs, ... }:

{ # Networking and locale information for framework
  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "framework"; 
  networking.firewall.checkReversePath = "loose"; # Necessary for tailscale + mullvad (see https://github.com/tailscale/tailscale/issues/10319)

  # Tailscale to connect to my other devices
  services.tailscale = {
    enable = true;
    authKeyFile = null; # TODO: set this using agenix
    extraSetFlags = [ ]; # TODO: add --exit-node=<mullvad>
  };

  # Enable GnuPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "America/Kentucky/Monticello";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
