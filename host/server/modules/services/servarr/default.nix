{
  users.groups.multimedia = { };

  imports = [
    ./bazarr.nix
    ./lidarr.nix
    ./prowlarr.nix
    ./radarr.nix
    ./readarr.nix
    ./sonarr.nix
  ];
}
