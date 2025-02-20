{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [ pkgs.distrobox ];
  };
}
