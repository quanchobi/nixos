{ lib, enableGui, ... }:
{
  programs.nixvim = {

    plugins = {
      guess-indent = {
        enable = true;
        settings = {
          auto_cmd = true;
          buftype_exclude = [
            #"help"
            #"nofile"
            #"terminal"
            #"prompt"
          ];
          filetype_exclude = [
            #"netrw"
            #"tutor"
          ];
          on_space_options = {
            expandtab = true;
            shiftwidth = "detected";
            softtabstop = "detected";
            tabstop = "detected";
          };
          on_tab_options = {
            expantab = true;
          };
          override_editorconfig = true;
        };
      };

      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            buftypes = [
              "terminal"
              "quickfix"
            ];
            filetypes = [
              ""
              "checkhealth"
              "help"
              "lspinfo"
              "packer"
              "TelescopePrompt"
              "TelescopeResults"
              "yaml"
            ];
          };
          indent = {
            char = "│";
          };
          scope = {
            show_end = false;
            show_exact_scope = true;
            show_start = false;
            highlight = lib.mkIf enableGui [
              "RainbowDelimiterRed"
              "RainbowDelimiterYellow"
              "RainbowDelimiterBlue"
              "RainbowDelimiterOrange"
              "RainbowDelimiterGreen"
              "RainbowDelimiterViolet"
              "RainbowDelimiterCyan"
            ];
          };
        };
      };

      rainbow-delimiters = {
        enable = true;
        highlight = lib.mkIf enableGui [
          "RainbowDelimiterRed"
          "RainbowDelimiterYellow"
          "RainbowDelimiterBlue"
          "RainbowDelimiterOrange"
          "RainbowDelimiterGreen"
          "RainbowDelimiterViolet"
          "RainbowDelimiterCyan"
        ];
      };

    };
  };
}
