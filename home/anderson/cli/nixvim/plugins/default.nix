{ lib, enableGui, ... }:
{
  imports = [
    ./dap.nix
    ./ollama.nix

    ./cmp
    ./editing
    ./git
    ./lsp
    ./ui
  ] ++ lib.optionals enableGui [ ./obsidian.nix ]; # Already backed up to git, doesn't need to be on my servers.
}