{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        indent.enable = false; # Seems to be broken unless I'm dumb? Never indents correctly.
        highlight.enable = true;
      };
      folding = false;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        lua
        make
        python

        c
        cpp
        rust

        sql
        javascript
        html
        dockerfile

        latex
        markdown
        markdown-inline
        regex
        vimdoc

        nix
        xml
        yaml
        toml
      ];
    };
    plugins.treesitter-context.enable = true;
  };
}
