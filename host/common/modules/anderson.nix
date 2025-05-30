{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    # anderson is the username I use on all of my Linux machines.
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
      shell = pkgs.nushell;
    };

    services.automatic-timezoned.enable = true;
  };
}
