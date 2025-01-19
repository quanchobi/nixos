{ pkgs, ... } : {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      blink-ripgrep-nvim
    ];
    plugins.blink-compat = {
      enable = true;
      settings = {
        debug = false;
        impersonate_nvim_cmp = true;
      };
    };
    plugins = {
      cmp-git.enable = true;
      cmp-treesitter.enable = true;
    };
    plugins.blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";
        signature.enabled = true;
        sources = {
          default = [
            "buffer"
              "ripgrep"
              "git"
              "lsp"
              "path"
              "snippets"
              "calc"
          ];
          providers = {
            git = {
              name = "git";
              module = "blink.compat.source";
            };
            ripgrep = {
              name = "Ripgrep";
              module = "blink-ripgrep";
            };
            calc = {
              name = "calc";
              module = "blink.compat.source";
            };
          };
        };
        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤶";
          };
        };
        completion = {
          trigger.show_in_snippet = false;
          documentation.auto_show = true;
          accept.auto_brackets.enabled = true;
        };
      };
    };
  };
                }
