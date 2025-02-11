{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
  # Was necessary for tailscale + mullvad prior to 24.11, see https://github.com/tailscale/tailscale/issues/10319
  # networking.firewall.checkReversePath = "loose";
}
