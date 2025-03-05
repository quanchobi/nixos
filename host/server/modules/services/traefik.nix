{ inputs, config, ... }:
let
  domain = "homelab.blenny-bramble.io";
in
{
  # For letsencrypt challenge
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  systemd.services.traefik = {
    environment = {
      CLOUDFLARE_EMAIL = "hanksj6@gmail.com";
    };
    serviceConfig = {
      #EnvironmentFile = config.age.secrets.cloudflare-api-key.path;
    };
  };

  services.traefik = {
    enable = true; # disabled until I get dnsChallenge working

    #-- STATIC CONFIG OPTIONS --#
    staticConfigOptions = {
      api = {
        dashboard = true;
        debug = true;
        insecure = true;
      };

      log = {
        level = "DEBUG";
        filePath = "${config.services.traefik.dataDir}/traefik.log";
        format = "json";
      };

      certificatesResolvers = {
        # Currently, Tailscale MagicDNS does not allow for CNAME records for machines.
        #   This means that it is not possible to make subdomains for a machine.
        #   Unfortunately, it is only possible to give one service TLS encryption and proxying for one service.
        #   For more info, check this issue: https://github.com/tailscale/tailscale/issues/1543
        tailscale.tailscale = { };
        letsencrypt = {
          acme = {
            email = "quanchobi@proton.me";
            storage = "/var/lib/traefik/cert.json";
            dnsChallenge.provider = "cloudflare";
          };
        };
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
            certResolver = "letsencrypt";
            domains = [
              {
                main = "${domain}";
                sans = [ "*.${domain}" ];
              }
            ];
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
              url = "http://localhost:8082";
            }
          ];
          traefik-dashboard.loadBalancer.servers = [
            {
              url = "localhost:8080";
            }
          ];
          jellyfin.loadBalancer.servers = [
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
            tls.certResolver = "letsencrypt";
          };
          traefik-dashboard = {
            entryPoints = [ "websecure" ];
            rule = "Host(`traefik.server.${domain}`)";
            service = "traefik-dashboard";
            tls.certResolver = "letsencrypt";
          };
          jellyfin = {
            entryPoints = [ "websecure" ];
            rule = "Host(`jellyfin.server.${domain}`)";
            service = "jellyfin";
            tls.certResolver = "letsencrypt";
          };
        };
      };
    };
  };

  # Allows traefik to fetch TLS cert for tailscale
  services.tailscale.permitCertUid = "traefik";
}
