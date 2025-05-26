{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    home.packages = with pkgs.gnomeExtensions; [
      blur-my-shell
      dash-to-dock
      forge
      user-themes
      caffeine
      tray-icons-reloaded
    ];

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          forge.extensionUuid
          user-themes.extensionUuid
          dash-to-dock.extensionUuid
          system-monitor.extensionUuid
          tray-icons-reloaded.extensionUuid
        ];

        disabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
