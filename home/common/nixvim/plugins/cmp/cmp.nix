{ pkgs, ...}: { # nixvim autocomplete engine #
  programs.nixvim = {
    plugins.cmp = {
      enable = false;
      autoEnableSources = true;
      settings = {
        snippets = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };

        # Autocomplete style
        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        # Keymappings
        mapping = {
        };
        sources = [
          { name = "luasnip"; }
          { name = "nvim-lsp"; }
          { name = "path"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "treesitter"; }
          { name = "buffer"; }
          { name = "orgmode"; }
        ];
      };
    };

    # kind icons for cmp menu
    #lspkind = {
    #  enable = true;
    #  cmp.enable = true;
    #};

    # Contains premade snippets for multiple languages
    plugins.friendly-snippets = {
      enable = true;
    };

    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
      ];
    };
  };
}
