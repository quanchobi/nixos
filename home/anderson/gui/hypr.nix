{ config, ... }:
{
  # All in one desktop environment. Dropped AGS due to a breaking update and being too lazy to fix it.
  # Hyprland, a lightweight Wayland window manager
  wayland.windowManager.hyprland = {
    enable = false;

    settings = {
      env = [
        "HYPRCURSOR_THEME, hypr_posy_black"
        "HYPRCURSOR_SIZE, 12"
      ];
      monitor = [
        "eDP-1, 2560x1600@165, 0x0, 1"
        ", preferred, auto, 1"
      ];

      general = {
        resize_on_border = true;
      };

      input = {
        touchpad = {
          natural_scroll = "yes";
        };
        kb_options = [
          # "ctrl:nocaps"
          # Handled by Kanata
        ];
      };

      gestures = {
        workspace_swipe = true;
      };

      decoration = {
        rounding = 10;
        blur.enabled = false;
      };

      # Key aliases
      "$mod" = "SUPER";
      "$s_mod" = "SUPER_SHIFT";

      # Common application aliases
      "$term" = "foot";
      "$browser" = "firefox";
      "$file_browser" = "dolphin";
      "$launcher" = "anyrun";

      bind = [
        # Window Management
        "$mod, q, killactive"
        "$mod, c, togglefloating"
        "$mod, f, fullscreen"
        "SUPER ALT, p, movecurrentworkspacetomonitor, -1"
        "SUPER ALT, n, movecurrentworkspacetomonitor, +1"

        # Focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        # Move on workspace
        "$s_mod, h, movewindow, l"
        "$s_mod, j, movewindow, d"
        "$s_mod, k, movewindow, u"
        "$s_mod, l, movewindow, r"

        # Move to workspace
        "SUPER_ALT, h, movetoworkspace, -1"
        "SUPER_ALT, l, movetoworkspace, +1"

        # Launchers
        "$mod,   t, exec, $term"
        "$mod,   b, exec, $browser"
        "$s_mod, f, exec, $file_browser"
        "$mod,   a, exec, $launcher"
      ];

      binds = [
        #keysym combos
      ];

      bindm = [
        # Mouse movements
        "$mod,   mouse:272, movewindow"
        "$s_mod, mouse:272, resizewindow"
      ];

      bindl = [
        # Media buttons
        ",XF86AudioPlay,    exec, playerctl play-pause"
        ",XF86AudioStop,    exec, playerctl pause"
        ",XF86AudioPause,   exec, playerctl pause"
        ",XF86AudioPrev,    exec, playerctl previous"
        ",XF86AudioNext,    exec, playerctl next"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindle = [
        # Volume and brightness buttons
        ",XF86MonBrightnessUp,    exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown,  exec, brightnessctl set  5%-"
        ",XF86AudioRaiseVolume,   exec, wpctl set-volume -l 1.00 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,   exec, wpctl set-volume -l 1.00 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,          exec, wpctl set-mute @DEFAULT_AUDIO_SINK toggle"
      ];

      exec-once = [
        "hyprpaper"
        "waybar"
      ];
    };
    plugins = [ ];
    systemd = {
      enable = true;
      extraCommands = [
        # Extra commands to run after D-Bus activation
      ];
      variables = [ "-all" ];
    };
    xwayland.enable = true;
  };

  # Hypridle, Hyprland's idle daemon
  services.hypridle = {
    enable = false;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  services.hyprpaper = {
    enable = false;
    settings = {
      ipc = "on";
      splash = "false";
      preload = [ "${config.stylix.image}" ];
      wallpaper = [ ",${config.stylix.image}" ];
    };
  };

  programs.waybar = {
    enable = false;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        size = 24;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "network"
          "battery"
          "tray"
          "clock"
        ];
      };
    };
  };
}
