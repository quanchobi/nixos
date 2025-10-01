{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "statix" ];
        yaml = [ "yamllint" ];
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-lint
    ];
  };
}
