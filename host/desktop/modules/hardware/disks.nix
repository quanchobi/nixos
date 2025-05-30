{ config, pkgs, ... }:
{
  age.secrets.samba-credentials.file = ../../../../secrets/samba-credentials.age;
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/mnt/crypt" = {
    device = "//server/mediashare";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.requires=tailscaled.service,x-systemd.automount,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=30s";
      in
      [ "${automount_opts},credentials=${config.age.secrets.samba-credentials.path},uid=anderson" ];
  };
}
