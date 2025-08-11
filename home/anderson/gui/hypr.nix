{ config, ... }:
{
  # All in one desktop environment. Dropped AGS due to a breaking update and being too lazy to fix it.
  # Hyprland, a lightweight Wayland window manager
  wayland.windowManager.hyprland = {
    enable = false;

    settings = {
      env = [
        #"HYPRCURSOR_THEME, hypr_posy_black"
        #"HYPRCURSOR_SIZE, 12"
      ];
      monitor = [
        ",preferred,auto,1"
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
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      # for laptop
      gestures = {
        workspace_swipe = true;
      };

      decoration = {
        rounding = 10;
        blur.enabled = false;
        drop_shadow = true;
        shadow_render_power = 3;
      };

      # animations = {
      #   enabled = true;
      #   bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      #   animation = [
      #     "windows, 1, 7, myBezier"
      #     "windowsOut, 1, 7, default, popin 80%"
      #     "border, 1, 10, default"
      #     "borderangle, 1, 8, default"
      #     "fade, 1, 7, default"
      #     "workspaces, 1, 6, default"
      #   ];
      # };

      # dwindle = {
      #   pseudotile = true;
      #   preserve_split = true;
      # };
      #
      # master = {
      #   new_is_master = true;
      # };

      # Key aliases
      "$mod" = "SUPER";
      "$s_mod" = "SUPER_SHIFT";

      # Common application aliases
      "$term" = "foot";
      "$browser" = "zen";
      "$file_browser" = "nautilus";
      "$launcher" = "anyrun";

      bind = [
        # Window Management
        "$mod, Q, exec, kitty"
        "$mod, q, killactive"
        "$mod, f, fullscreen"
        "SUPER ALT, p, movecurrentworkspacetomonitor, -1"
        "SUPER ALT, n, movecurrentworkspacetomonitor, +1"
        "$mod, V, togglefloating,"
        "$mod, R, exec, rofi -show drun"
        # "$mainMod, P, pseudo," # dwindle
        # "$mainMod, J, togglesplit," # dwindle

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
        #"hyprpaper"
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
  # services.hypridle = {
  #   enable = false;
  #   settings = {
  #     general = {
  #       after_sleep_cmd = "hyprctl dispatch dpms on";
  #       ignore_dbus_inhibit = false;
  #       lock_cmd = "hyprlock";
  #     };
  #
  #     listener = [
  #       {
  #         timeout = 900;
  #         on-timeout = "hyprlock";
  #       }
  #       {
  #         timeout = 1200;
  #         on-timeout = "hyprctl dispatch dpms off";
  #         on-resume = "hyprctl dispatch dpms on";
  #       }
  #     ];
  #   };
  # };
  #
  # services.hyprpaper = {
  #   enable = false;
  #   settings = {
  #     ipc = "on";
  #     splash = "false";
  #     preload = [ "${config.stylix.image}" ];
  #     wallpaper = [ ",${config.stylix.image}" ];
  #   };
  # };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
          "hyprland/scratchpad"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "battery"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "hyprland/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "hyprland/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: 'Font Awesome 5 Free', 'Ubuntu';
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.8);
        border-bottom: 3px solid rgba(100, 114, 125, 0.5);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray,
      #mode,
      #scratchpad {
        padding: 0 10px;
        color: #ffffff;
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      #clock {
        background-color: #64727D;
      }

      #battery {
        background-color: #ffffff;
        color: #000000;
      }

      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: #000000;
      }

      #cpu {
        background-color: #2ecc71;
        color: #000000;
      }

      #memory {
        background-color: #9b59b6;
      }

      #network {
        background-color: #2980b9;
      }

      #network.disconnected {
        background-color: #f53c3c;
      }

      #pulseaudio {
        background-color: #f1c40f;
        color: #000000;
      }

      #pulseaudio.muted {
        background-color: #90b1b1;
        color: #2a5c45;
      }

      #temperature {
        background-color: #f0932b;
      }

      #temperature.critical {
        background-color: #eb4d4b;
      }

      #tray {
        background-color: #2980b9;
      }

      #scratchpad {
        background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
        background-color: transparent;
      }
    '';
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
      };

      urgency_normal = {
        timeout = 10;
      };
    };
  };
}
