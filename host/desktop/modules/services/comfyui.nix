{ pkgs, ... }:

{
  users.users.anderson.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;

  # Create systemd service for ComfyUI container
  systemd.services.comfyui-docker = {
    description = "ComfyUI Docker Container";
    after = [ "docker.service" ];
    requires = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStartPre = [
        # Pull image
        "${pkgs.docker}/bin/docker pull yanwk/comfyui-boot:cu129-slim"
        # Stop and remove old container if exists
        "-${pkgs.docker}/bin/docker stop comfyui"
        "-${pkgs.docker}/bin/docker rm comfyui"
      ];
      ExecStart = ''
        ${pkgs.docker}/bin/docker run -d \
          --name comfyui \
          --gpus all \
          -p 8188:8188 \
          -v /var/lib/comfyui/models:/root/ComfyUI/models \
          -v /var/lib/comfyui/output:/root/ComfyUI/output \
          -v /var/lib/comfyui/input:/root/ComfyUI/input \
          --restart unless-stopped \
          yanwk/comfyui-boot:cu129-slim
      '';
      ExecStop = "${pkgs.docker}/bin/docker stop comfyui";
    };
  };

  # Create persistent directories
  systemd.tmpfiles.rules = [
    "d /var/lib/comfyui 0755 root root -"
    "d /var/lib/comfyui/models 0755 root root -"
    "d /var/lib/comfyui/output 0755 root root -"
    "d /var/lib/comfyui/input 0755 root root -"
  ];
}
