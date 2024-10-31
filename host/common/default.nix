{pkgs, ...}:
{
  imports = [
    #./keymap
  ];

  environment.systemPackages = with pkgs; [
    # CLI Utilities
    wget
    git
    tmux
    vim
    zsh
    glxinfo
    gperftools
    pciutils
  ];
}
