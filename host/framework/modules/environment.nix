{ pkgs, ... }:
{ # Environment configuration. Contains system packages and environment variables.
  environment = {
    systemPackages = with pkgs; [
      wget
      brightnessctl
      ddcutil
      zsh
      gcc
      glib
      glibc
      gtk3
      webkitgtk
      gjs
      virtualglLib
      virtualgl
      glxinfo
      gperftools
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
      hyprpaper
    ];

    # Environment variables
    variables = {
      EDITOR = "vi";
      SYSTEMD_EDITOR = "vi";
      VISUAL = "vi";
    };
  };
}
