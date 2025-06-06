{
  pkgs,
  inputs,
  config,
  lib,
  enableGui,
  ...
}:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}; # unstable pkgs overlay
in
{
  imports = [
    ./cli # Always add cli module
  ] ++ (lib.optionals enableGui [ ./gui ]); # Add gui module if gui is enabled

  options = { };

  # Create option to enable gui apps for non terminal only machines
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  config = {
    home = {
      username = "anderson";
      homeDirectory = "/home/anderson";
      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update the value, then make sure to first check the Home Manager
      # release notes.
      stateVersion = "24.05"; # DO NOT CHANGE

      # The home.packages option allows you to install Nix packages into your
      # environment.

      # Home Manager is pretty good at managing dotfiles. The primary way to manage
      # plain files is through 'home.file'.
      file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;

        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
      };
      sessionVariables = { };
      # You can also manage environment variables but you will have to manually
      # source
      #
      #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      #
      # or
      #
      #  /etc/profiles/per-user/anderson/etc/profile.d/hm-session-vars.sh
      #
      # if you don't want to manage your shell through Home Manager.
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

  };
}
