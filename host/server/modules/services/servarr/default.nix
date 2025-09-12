{
  imports = [
    ./bazarr.nix
    ./flaresolverr.nix
    ./lidarr.nix
    ./prowlarr.nix
    ./radarr.nix
    ./readarr.nix
    ./sonarr.nix
  ];

  # Configure umask for *arrs
  systemd = {
    services = {
      sonarr.serviceConfig.UMask = "0002";
      radarr.serviceConfig.UMask = "0002";
      readarr.serviceConfig.UMask = "0002";
      bazarr.serviceConfig.UMask = "0002";
      deluge.serviceConfig.UMask = "0002";
      prowlarr.serviceConfig.UMask = "0002";
      lidarr.serviceConfig.UMask = "0002";
    };
    tmpfiles.rules = [
      "d /mnt/mirror-8tb/Downloads/ 2775 root multimedia - -"
      "d /mnt/crypt/samba_share/ 2775 root multimedia - -"
    ];
  };
}
