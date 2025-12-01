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
      lmstudio
      LycheeSlicer
      mgba
      nvtopPackages.full
      qemu-utils
      ryujinx
      teams-for-linux
      tor-browser
      via
    ];
  };
}
