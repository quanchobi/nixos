{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # CLI Utilities
    wget
    git

    tmux
    zsh
    glxinfo
    gperftools
    pciutils
  ];
}
