{ pkgs, ... }:
let
  jellyfin-ffmpeg-overlay = (
    final: prev: {
      jellyfin-ffmpeg = prev.jellyfin-ffmpeg.override {
        ffmpeg_7-full = prev.ffmpeg_7-full.override {
          withMfx = false;
          withVpl = true;
          withUnfree = true;
        };
      };
    }
  );
in
{
  nixpkgs.overlays = [ jellyfin-ffmpeg-overlay ];

  services.jellyfin = {
    enable = true;
    user = "jellyfin";
    group = "jellyfin";
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    clinfo # for debugging
    intel-gpu-tools # for debugging
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      libva-vdpau-driver
      intel-media-driver
      intel-compute-runtime
      intel-ocl
    ];
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
