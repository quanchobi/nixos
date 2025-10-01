{
  config,
  lib,
  inputs,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.system.gui.enable = lib.mkEnableOption "Enable GUI applications";

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      sharedModules = [
        inputs.nixvim.homeManagerModules.default
      ]
      ++ lib.optionals config.system.gui.enable [
        inputs.stylix.homeModules.stylix
      ];
      users.anderson = import ../../../home/anderson/home.nix;
      extraSpecialArgs = {
        inherit inputs;
        enableGui = config.system.gui.enable;
      };
    };
  };
}
