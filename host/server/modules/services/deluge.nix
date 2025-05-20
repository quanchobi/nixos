{ config, ... }:
{
  age.secrets.deluge-credentials.file = ../../.../../../../secrets/deluge-credentials.age;

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
