{
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];

  imports = [
    ./servarr
    ./samba.nix
    ./minecraft.nix
    ./jellyfin.nix
    ./nextcloud.nix
    ./home-assistant.nix
    ./transmission.nix
    ./syncthing.nix
    ./homepage.nix
  ];
}
