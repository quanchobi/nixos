{ inputs, pkgs, ... }:
{
  environment.systemPackages =
    with pkgs;
    [
      # CLI Utilities
      wget
      git

      tmux
      zsh
      gperftools
      pciutils

    ]
    ++ [
      inputs.agenix.packages.x86_64-linux.default
    ];
}
