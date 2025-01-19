{pkgs, ...}:
{
  imports = [
    ./keymap.nix
  ];

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
