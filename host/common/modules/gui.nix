{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake
    cmake
    dolphin-emu
    hugo
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
    wl-clipboard
    virtiofsd
  ];
}
