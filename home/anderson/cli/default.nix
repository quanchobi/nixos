{ pkgs, ... }:
{
  imports = [
    ./eza.nix
    ./git.nix
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

    # Dev tools
    cargo
    nodejs_22
    python3

    # Fonts
    aegyptus
    nerdfonts
    symbola
  ];
}
