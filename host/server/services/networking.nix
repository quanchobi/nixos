{
  services.traefik = {
    enable = true;
    dynamicConfigOptions = {};
    staticConfigOptions = {};
  };

  services.tailscale = {
    enable = true;
    # Enable vpn and https
  };
}
