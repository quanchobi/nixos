{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.intone-mono;
      name = "IntoneMono Nerd Font Mono";
      theme = "Espresso";
    };

    settings = {
      hide_window_decorations = "yes";
      enable_audio_bell = false;
      disable_ligatures = "never";
      font_family.family = "IntoneMono Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "12.0";
      # background = "#323232";
      # foreground = "#ffffff";
      # cursor = "#d6d6d6";
      # selection_background = "#5b5b5b";
      # selection_foreground = "#323232";
      # color0 = "#353535";
      # color8 = "#535353";
      # color1 = "#d25252";
      # color9 = "#f00c0c";
      # color2 = "#a4c161";
      # color10 = "#c1df74";
      # color3 = "#ffc56d";
      # color11 = "#e1e48a";
      # color4 = "#6c99ba";
      # color12 = "#8ab6d9";
      # color5 = "#d096d9";
      # color13 = "#efb5f7";
      # color6 = "#bdd6ff";
      # color14 = "#dbf4ff";
      # color7 = "#ededec";
      # color15 = "#ffffff";
      # active_tab_foreground = "#ffffff";
      # active_tab_background = "#535353";
      # inactive_tab_foreground = "#ffffff";
      # inactive_tab_background = "#353535";
    };
  };
}
