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

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ vpl-gpu-rt ];
  };
  services.logrotate.enable = true;
}
