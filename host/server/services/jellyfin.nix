{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin 
    jellyfin-web 
    jellyfin-ffmpeg
  ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs: [ onevpl-intel-gpu ];
  services.logrotate.enable = true;
}
