{ pkgs, inputs, config, ... }:
{
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        shell
        translate
        rink
        kidex
        dictionary
        websearch
        symbols
      ];

#      x = { fraction = 0.5; };
#      y = { absolute = 15; };

#      width = { fraction = 0.3; };
#      height = { absolute = 0; };

      hideIcons = false;
      ignoreExclusiveZones = false;
#      layer = "overlay";

      hidePluginInfo = false;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = null;
    };
  };
}
