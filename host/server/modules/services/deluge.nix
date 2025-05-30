{ pkgs, config, ... }:
{
  age.secrets.deluge-credentials.file = ../../.../../../../secrets/deluge-credentials.age;

  # Wait for tailscale interface before starting deluge to prevent ip leaks
  systemd.services.deluged = {
    after = [
      "tailscale.service"
      "network-online.target"
    ];
    wants = [
      "tailscale.service"
      "network-online.target"
    ];

    serviceConfig = {
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 10";
    };
  };

  networking.firewall = {
    # Allow deluge through the tailscale and loopback interfaces only
    extraCommands = ''
      # Create a new chain for Deluge traffic
      ${pkgs.iptables}/bin/iptables -N DELUGE_TRAFFIC || true

      # Flush existing rules in the chain
      ${pkgs.iptables}/bin/iptables -F DELUGE_TRAFFIC

      # Allow outgoing connections only through tailscale0 and webui
      ${pkgs.iptables}/bin/iptables -A DELUGE_TRAFFIC -o tailscale0 -j ACCEPT
      ${pkgs.iptables}/bin/iptables -A DELUGE_TRAFFIC -o lo -j ACCEPT

      # Drop any other outgoing connections
      ${pkgs.iptables}/bin/iptables -A DELUGE_TRAFFIC -j DROP

      # Add Deluge's traffic to the DELUGE_TRAFFIC chain
      ${pkgs.iptables}/bin/iptables -A OUTPUT -m owner --uid-owner deluge -j DELUGE_TRAFFIC
    '';

    # Clean up rules when stopped
    extraStopCommands = ''
      ${pkgs.iptables}/bin/iptables -D OUTPUT -m owner --uid-owner deluge -j DELUGE_TRAFFIC 2>/dev/null || true
      ${pkgs.iptables}/bin/iptables -F DELUGE_TRAFFIC 2>/dev/null || true
      ${pkgs.iptables}/bin/iptables -X DELUGE_TRAFFIC 2>/dev/null || true
    '';
  };

  services.deluge = {
    enable = true;
    group = "multimedia";
    declarative = true;
    #authFile = "${config.age.secrets.deluge-credentials.path}"; # This causes errno 13, permission denied.
    dataDir = "/home/deluge";

    # instead we use the following anti pattern! It doesn't really matter to me if it is readable in the nix store.
    # I am the only one who uses this machine and someone breaking into a torrenting client isnt my biggest concern.
    authFile =
      let
        deluge_auth_file = (builtins.toFile "auth") ''
          localclient:password321:10
        '';
      in
      deluge_auth_file;

    config = {
      download_location = "/mnt/mirror-8tb/Downloads";
      max_upload_speed = "1000.0";
      share_ratio_limit = "2.0";
      allow_remote = true;
      enabled_plugins = [ "Label" ];
      listen_interface = "tailscale0";
      outgoing_interface = "tailscale0";
    };

    web = {
      enable = true;
      openFirewall = true;
    };
  };
}
