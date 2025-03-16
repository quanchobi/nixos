{ config, ... }:
{
  #age.secrets.transmission-credentials.file = ../../../../secrets/transmission-credentials.age;

  services.transmission = {
    enable = false;
    settings.download-dir = "/mnt/crypt/samba_share/Media/Downloads";
    group = "multimedia";
    openRPCPort = true;
    settings = {
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist = "100.119.124.119,192.168.1.0/24";
    };
    credentialsFile = "${config.age.secrets.transmission-credentials.path}";
  };
}
