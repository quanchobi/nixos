{ pkgs, ... }:
{
  config = {
    # TODO: Some of these need to go to common
    environment.systemPackages = with pkgs; [
      cmake
      gcc
      gnumake
      glib
      glibc
      glxinfo
      gperftools
      krita
      lazymc
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
