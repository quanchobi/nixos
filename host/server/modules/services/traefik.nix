{ config, ... }:
let
  domain = "blenny-bramble.ts.net";
in
{
  services.traefik = {
    enable = true;

    #-- STATIC CONFIG OPTIONS --#
    staticConfigOptions = {
      api = {
        dashboard = true;
        debug = true;
      };

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
          asDefault = true;
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
            permanent = true;
          };
        };

        websecure = {
          address = "0.0.0.0:443";
          asDefault = true;
          http.tls = {
            certResolver = "tailscale";
            # domains = [
            #   {
            #     main = "${domain}";
            #     sans = "*.${domain}";
            #   }
            # ];
          };
        };
      };
    };

    #-- DYNAMIC CONFIG OPTIONS --#
    dynamicConfigOptions = {
      http = {
        services = {
          homepage.loadBalancer.servers = [
            {
              url = "http://localhost:8096";
            }
          ];
        };

        routers = {
          homepage = {
            entryPoints = [ "websecure" ];
            rule = "Host(`server.${domain}`)";
            service = "homepage";
            tls.certResolver = "tailscale";
          };
        };
      };
    };
  };

  # Allows traefik to fetch TLS cert for tailscale
  services.tailscale.permitCertUid = "traefik";
}
