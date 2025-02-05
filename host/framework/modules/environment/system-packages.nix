{ pkgs, ... }:
{
  config = {
    # TODO: Some of these need to go to common
    environment.systemPackages = with pkgs; [
      gnumake
      cmake
      wget
      zsh
      gcc
      neovim
      glib
      glibc
      virtualglLib
      virtualgl
      glxinfo
      gperftools
      moonlight-qt
    ];
  };
}
