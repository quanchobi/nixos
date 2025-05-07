{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    virtualisation.podman = {
      enable = true;
    };

    environment.systemPackages = [ pkgs.distrobox ];
  };
}
