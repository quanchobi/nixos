{
  services.transmission = {
    enable = true;
    settings.download-dir = "/mnt/crypt/samba_share/Media/Downloads";
    group = "multimedia";
    openRPCPort = true;
    settings = {
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist = "100.119.124.119,192.168.1.0/24";
    };
    credentialsFile = "/home/anderson/secrets/settings.json";
  };
}
