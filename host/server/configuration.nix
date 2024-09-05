{config, lib, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  boot.loader.systemd-boot.enable = true;

  imports = [
    ./services
    ./system
  ];

  time.timeZone = "Kentucky/Monticello";

  users.users.anderson = {
    isNormalUser = true;
    extraGroups = [ "wheel" "multimedia" ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    tmux
    vim
  ];

  system.stateVersion = "24.05"; # IMPORTANT: DO NOT CHANGE
}
