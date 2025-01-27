{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    # Environment configuration. Contains system packages and environment variables.
    environment = {
      systemPackages = with pkgs; [
        gnumake
        cmake
        wget
        brightnessctl
        ddcutil
        wl-clipboard
        zsh
        gcc
        glib
        glibc
        gtk3
        gjs
        virtualglLib
        virtualgl
        glxinfo
        gperftools
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-libav
        gst_all_1.gst-vaapi
        nixd
      ];

      # Environment variables
      variables = {
        EDITOR = "vi";
        SYSTEMD_EDITOR = "vi";
        VISUAL = "vi";
      };
    };
  };
}
