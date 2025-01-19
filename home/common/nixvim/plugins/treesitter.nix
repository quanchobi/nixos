{ pkgs, ... }: {
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        indent.enable = false; # Seems to be broken unless I'm dumb?
        highlight.enable = true;
      };
      folding = false;
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    plugins.treesitter-context.enable = true;
  };
}
