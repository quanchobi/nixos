{ pkgs, config, ... }:
{
  imports = [ ];

  options = { };

  config = {
    programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
