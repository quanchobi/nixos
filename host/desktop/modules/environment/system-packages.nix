{ pkgs, ... }:
{
  config = {
    # TODO: Some of these need to go to common
    environment.systemPackages = with pkgs; [
      bsnes-hd
      cmake
      desmume
      dolphin-emu
      gcc
      gnumake
      glib
      glibc
      glxinfo
      gperftools
      krita
      lazymc
      LycheeSlicer
      mgba
      moonlight-qt
      neovim
      nvtopPackages.full
      orca-slicer
      qemu-utils
      ryujinx
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
