{ lib, enableGui, ... }:
{
  imports = [
    ./autopairs.nix
    ./avante.nix
    ./base16.nix
    ./comment.nix
    ./dap.nix
    ./godot.nix
    ./guess-indent.nix
    ./lualine.nix
    ./lz-n.nix
    ./noice.nix
    ./ollama.nix
    ./otter.nix
    ./startup.nix
    ./telescope.nix
    ./treesitter.nix
    ./whichkey.nix
    ./undotree.nix

    ./cmp
    ./lsp
  ] ++ lib.optionals enableGui [ ./obsidian.nix ]; # Already backed up to git, doesn't need to be on my servers.
}
