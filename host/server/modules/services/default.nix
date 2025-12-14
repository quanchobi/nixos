{
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];

  imports = [
    ./grafana.nix
    ./home-assistant.nix
    ./homepage.nix
    ./deluge.nix
    ./immich.nix
    ./jellyfin.nix
    ./openssh.nix
    ./prometheus.nix
    ./radicale.nix
    ./samba.nix
    ./servarr
    ./syncthing.nix
    ./tailscale.nix
    ./traefik.nix
    ./transmission.nix
  ];
}
