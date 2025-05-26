{ pkgs, ... }:
{
  imports = [
    ./eza.nix
    ./git.nix
    ./nushell.nix
    ./password-store.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix

    ./nixvim
  ];

  home.packages = with pkgs; [
    # Utilities
    btop
    netcat-gnu
    unzip

    # Fonts
    aegyptus
    nerd-fonts.intone-mono
    symbola
  ];
}
