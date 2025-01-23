{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [ ripgrep ];
    plugins.web-devicons.enable = true;
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser = {
          enable = true;
          settings.hijack_netrw = true;
        };
        fzf-native = {
          enable = true;
        };
        undo = {
          enable = true;
        };
      };
    };
  };
}
