{
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];

  imports = [
    ./home-assistant.nix
    ./homepage.nix
    ./jellyfin.nix
    ./minecraft.nix
    ./ollama.nix
    ./openssh.nix
    ./radicale.nix
    ./samba.nix
    ./servarr
    ./syncthing.nix
    ./tailscale.nix
    ./traefik.nix
    ./transmission.nix
  ];
}
