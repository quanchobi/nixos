{ config, ... }:
let
  domain = "blenny-bramble.ts.net";
in
{
  services = {
    tailscale.permitCertUid = "traefik";

    traefik = {
      enable = true;
      staticConfigOptions = {
        log = {
          level = "DEBUG";
          filePath = "${config.services.traefik.dataDir}/traefik.log";
          format = "json";
        };

        certificatesResolvers = {
          tailscale.tailscale = { };
        };

        entryPoints = {
          web = {
            address = "0.0.0.0:80";
            http.redirections.entrypoint = {
              to = "websecure";
              scheme = "https";
              permanent = true;
            };
          };

          websecure = {
            address = "0.0.0.0:443";
            http.tls = {
              certResolver = "tailscale";
            };
          };
        };
      };

      dynamicConfigOptions = {
        http = {
          services.open-webui.loadBalancer.servers = [
            {
              url = "http://localhost:8081";
            }
          ];

          routers.open-webui = {
            entryPoints = [ "websecure" ];
            rule = "Host(`desktop-nixos.${domain}`)";
            service = "open-webui";
            tls.certResolver = "tailscale";
          };
        };
      };
    };
  };
}
