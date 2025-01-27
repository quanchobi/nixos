{ lib, enableGui, ... }:
{
  imports = [
    ./autopairs.nix
    ./base16.nix
    ./comment.nix
    ./godot.nix
    ./guess-indent.nix
    ./lualine.nix
    ./lz-n.nix
    ./noice.nix
    ./ollama.nix
    ./startup.nix
    ./telescope.nix
    ./treesitter.nix
    ./whichkey.nix
    ./undotree.nix

    ./cmp
    ./lsp
  ] ++ lib.optionals enableGui [ ./obsidian.nix ]; # Already backed up to git, doesn't need to be on my servers.
}
