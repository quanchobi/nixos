{
  users.users.anderson.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
  };

  hardware.nvidia-container-toolkit.enable = true;
}
