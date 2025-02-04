{
  services.deluge = {
    enable = true;
    declarative = true;
    authFile = ""; # TODO: agenix
    config = {
      download_location = "/srv/torrents/";
      max_upload_speed = "1000.0";
      share_ratio_limit = "2.0";
      allow_remote = true;
      daemon_port = 58846;
      listen_ports = [
        6881
        6889
      ];
    };

    dataDir = "/mnt/piracy/";

    web = {
      enable = true;
      port = 8112;
      openFirewall = true;
    };
  };
}
