{
  pkgs,
  lib,
  config,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;

  imports = [
    ./services
    ./system
    ../common
  ];

  time.timeZone = "Kentucky/Monticello";

  programs.zsh.enable = true;

  users.users.anderson = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "multimedia"
      "uinput"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.05"; # IMPORTANT: DO NOT CHANGE
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
}
