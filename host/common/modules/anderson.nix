{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    programs.zsh.enable = true;

    users.users.anderson = {
      isNormalUser = true;
      description = "Jacob Hanks";
      extraGroups = [
        "networkmanager"
        "multimedia"
        "wheel"
        "i2c"
        "uinput"
        "render"
        "video"
      ];
      shell = pkgs.zsh;
    };

    services.automatic-timezoned.enable = true;
  };
}
