{ pkgs, ... }:
{
  config = {
    # TODO: Some of these need to go to common
    environment.systemPackages = with pkgs; [
      bsnes-hd
      desmume
      discord
      distrobox
      kitty
      krita
      lazymc
      LycheeSlicer
      mgba
      nvtopPackages.full
      qemu-utils
      ryujinx
      rpi-imager
      teams-for-linux
      tor-browser
      via
    ];
  };
}
