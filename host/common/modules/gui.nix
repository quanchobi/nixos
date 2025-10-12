{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake
    cmake
    distrobox
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
    podman
    wl-clipboard
    virtiofsd
  ];
}
