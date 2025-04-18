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
      krita
      neovim
      virtualglLib
      virtualgl
      moonlight-qt
      via
      wget
      wl-clipboard
      zsh
    ];
  };
}
