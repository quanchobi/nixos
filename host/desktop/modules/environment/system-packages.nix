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
      lazymc
      tor-browser
      krita
      neovim
      virtualglLib
      virtualgl
      moonlight-qt
      ryujinx
      via
      virtiofsd
      wget
      wl-clipboard
      zsh
    ];
  };
}
