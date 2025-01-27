{ pkgs, ... }:
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

    # Cachix
    cachix
  ];
  users.users.anderson.shell = pkgs.nushell;
}
