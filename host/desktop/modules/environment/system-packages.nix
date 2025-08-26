{ pkgs, ... }:
{
  config = {
    # TODO: Some of these need to go to common
    environment.systemPackages = with pkgs; [
      bsnes-hd
      cmake
      desmume
      discord
      dolphin-emu
      distrobox
      gcc
      gnumake
      glib
      glibc
      glxinfo
      gperftools
      kitty
      krita
      lazymc
      LycheeSlicer
      mgba
      moonlight-qt
      neovim
      nvtopPackages.full
      qemu-utils
      ryujinx
      rpi-imager
      tor-browser
      wget
      wl-clipboard
      via
      virtiofsd
      virtualglLib
      virtualgl
      zsh
    ];
  };
}
