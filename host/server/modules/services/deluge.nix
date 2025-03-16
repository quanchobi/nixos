{ config, ... }:
{
  age.secrets.deluge-credentials.file = ../../.../../../../secrets/deluge-credentials.age;

  services.deluge = {
    enable = true;
    declarative = true;
    #authFile = "${config.age.secrets.deluge-credentials.path}";
    dataDir = "/home/deluge";
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
    };

    web = {
      enable = true;
      openFirewall = true;
    };
  };
}
