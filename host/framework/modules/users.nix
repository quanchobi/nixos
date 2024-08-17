{ config, pkgs, ... }:
{ # Define all users here
  # Needs to be enabled to allow anderson the use zsh as login shell
  programs.zsh.enable = true;

  users.users.anderson = {
    isNormalUser = true;
    description = "Jacob Hanks";
    extraGroups = [ "networkmanager" "wheel" "i2c" "uinput" ];
    shell = pkgs.zsh;
  };
}
