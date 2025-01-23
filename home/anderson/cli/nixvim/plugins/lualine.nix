let colors = {
  base00 = "#1c2023";
  base01 = "393f45";
  base02 = "565e65";
  base03 = "747c84";
  base04 = "adb3ba";
  base05 = "c7ccd1";
  base06 = "dfe2e5";
  base07 = "f3f4f5";
  base08 = "c7ae95";
  base09 = "c7c795";
  base0A = "aec795";
  base0B = "95c7ae";
  base0C = "95aec7";
  base0D = "ae95c7";
  base0E = "c795ae";
  base0F = "";
}; in
{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = {
            normal = {
              a = {
                bg = "nil";
              };
              b = {
                bg = "nil";
              };
              c = {
                bg = "nil";
              };
              z = {
                bg = "nil";
              };
              y = {
                bg = "nil";
              };
            };
          };
          globalstatus = true;
          disabled_filetypes = {
            statusline = [
              "dashboard"
                "alpha"
                "starter"
                "snacks_dashboard"
            ];
          };
        };
        inactive_sections = {
          lualine_x = [
            "filename"
              "filetype"
          ];
        };
        sections = {
          lualine_a = [
          {
            __unkeyed = "mode";
            fmt = "string.lower";
            color = {
              fg = colors.base04;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          ];
          lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            color = {
              fg = colors.base04;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "diff";
            separator.left = "";
            separator.right = "";
          }
          ];
          lualine_c = [
          {
            __unkeyed = "diagnostic";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
            color = {
              fg = colors.base08;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          ];
          lualine_x = [ "" ];
          lualine_y = [
          {
            __unkeyed = "filetype";
            icon_only = true;
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "filename";
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
            color = {
              fg = colors.base05;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          ];
          lualine_z = [
          {
            __unkeyed = "location";
            color = {
              fg = colors.base0B;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          ];
        };
      };
    };
  };
}
