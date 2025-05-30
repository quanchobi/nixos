{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    user = "jellyfin";
    group = "jellyfin";
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

  users.users.jellyfin = {
    extraGroups = [
      "video"
      "render"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="renderD*", GROUP="render", MODE="0666"
  '';
}
