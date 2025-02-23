# TODO: Refactor into individual services
{
  # Networking and locale information for framework
  # Enable networking
  imports = [ ];

  options = { };

  config = {
    networking = {
      networkmanager.enable = true;
      hostName = "desktop";
      firewall.checkReversePath = "loose"; # Necessary for tailscale + mullvad (see https://github.com/tailscale/tailscale/issues/10319)
    };

    # Tailscale to connect to my other devices
    services.tailscale = {
      enable = true;
      authKeyFile = null; # TODO: set this using agenix
      extraSetFlags = [ ]; # TODO: add --exit-node=<mullvad>
    };

    # Set your time zone.
    #    time.timeZone = "America/Kentucky/Monticello"; # set in common

    # Select internationalisation properties. Maybe move to common
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
  };
}
