{pkgs, ...}:
{
  imports = [
    ./keymap
  ];

  environment.systemPackages = with pkgs; [
    # CLI Utilities
    wget
    git
    tmux
    nvim
    zsh
    glxinfo
    gperftools
    pciutils
  ];
}
