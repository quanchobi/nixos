{ config, ... }:
let
  domain = "blenny-bramble.ts.net";
in
{
  age.secrets = {
    dashboard-env = {
      file = ../../../../secrets/dashboard-env.age;
      owner = "root";
      mode = "400";
    };
  };

  services.homepage-dashboard = {
    environmentFile = config.age.secrets.dashboard-env.path;
    enable = true;
    listenPort = 8082;

    settings = {
      favicon = "https://quanchobi.io/favicon.ico";
      background = {
        image = "https://images.unsplash.com/photo-1502790671504-542ad42d5189?auto=format&fit=crop&w=2560&q=80";
        blur = "md";
      };
      cardBlue = "xs";

      headerStyle = "clean";

      providers = {
        finnhub = "{{HOMEPAGE_VAR_FINNHUB_API_KEY}}";
      };
    };

    bookmarks = [
      {
        Dev = [
          {
            github = [
              {
                href = "https://github.com";
                icon = "github-light.png";
              }
            ];
          }
          {
            nix-search = [
              {
                href = "https://search.nixos.org";
                icon = "nixos.svg";
              }
            ];
          }
          {
            home-manager = [
              {
                href = "https://nix-community.github.io/home-manager/";
                icon = "nixos.svg";
              }
            ];
          }
          {
            tailscale = [
              {
                href = "https://login.tailscale.com";
                icon = "tailscale.png";
              }
            ];
          }
          {
            hostinger = [
              {
                href = "https://hpanel.hostinger.com";
                icon = "hostinger.svg";
              }
            ];
          }
        ];
      }
      {
        FDM = [
          {
            shadowheart = [
              {
                href = "http://fdm-shadowheart";
                icon = "https://i.etsystatic.com/26093962/r/il/b8368e/5320985441/il_1080xN.5320985441_56an.jpg";
              }
            ];
          }
          {
            theseus = [
              {
                href = "http://fdm-theseus";
                icon = "https://www.menofthewest.net/wp-content/uploads/2021/01/Theseus.png";
              }
            ];
          }
        ];
      }
      {
        School = [
          {
            canvas = [
              {
                href = "https://www.uky.edu/canvas";
                icon = "https://www.instructure.com/sites/default/files/image/2021-12/Canvas_logo_single_mark.png";
              }
            ];
          }
          {
            myuk = [
              {
                href = "https://myuk.uky.edu";
                icon = "https://brand.uky.edu/sites/default/files/styles/max_650x650/public/2022-09/logo-registration.webp?itok=hLe7Mc_P";
              }
            ];
          }
          {
            outlook = [
              {
                href = "https://outlook.com";
                icon = "microsoft-outlook.svg";
              }
            ];
          }
        ];
      }
      {
        Social = [
          {
            youtube = [
              {
                href = "https://youtube.com";
                icon = "youtube.png";
              }
            ];
          }
          {
            blog = [
              {
                href = "https://quanchobi.io";
                icon = "https://quanchobi.io/favicon.ico";
              }
            ];
          }
        ];
      }
    ];
    services = [
      {
        Media = [
          {
            Jellyfin = {
              icon = "jellyfin.png";
              href = "http://server.${domain}:8096";
              description = "Media player";
              widget = {
                type = "jellyfin";
                url = "http://server.${domain}:8096";
                key = "{{HOMEPAGE_VAR_JELLYFIN_API_KEY}}";
              };
            };
          }
          {
            Radarr = {
              icon = "radarr.png";
              href = "http://server.${domain}:7878";
              description = "Movie manager";
              widget = {
                type = "radarr";
                url = "http://server.${domain}:7878";
                key = "{{HOMEPAGE_VAR_RADARR_API_KEY}}";
              };
            };
          }
          {
            Sonarr = {
              icon = "sonarr.png";
              href = "http://server.${domain}:8989";
              description = "TV Show manager";
              widget = {
                type = "sonarr";
                url = "http://server.${domain}:8989";
                key = "{{HOMEPAGE_VAR_SONARR_API_KEY}}";
              };
            };
          }
          {
            Lidarr = {
              icon = "lidarr.png";
              href = "http://server.${domain}:8686";
              description = "Music manager";
              widget = {
                type = "lidarr";
                url = "http://server.${domain}:8686";
                key = "{{HOMEPAGE_VAR_LIDARR_API_KEY}}";
              };
            };
          }
          {
            Readarr = {
              icon = "readarr.png";
              href = "http://server.${domain}:8787";
              description = "Book manager";
              widget = {
                type = "readarr";
                url = "http://server.${domain}:8787";
                key = "{{HOMEPAGE_VAR_READARR_API_KEY}}";
              };
            };
          }
          {
            Prowlarr = {
              icon = "prowlarr.png";
              href = "http://server.${domain}:9696";
              description = "Servarr manager";
              widget = {
                type = "prowlarr";
                url = "http://server.${domain}:9696";
                key = "{{HOMEPAGE_VAR_PROWLARR_API_KEY}}";
              };
            };
          }
          {
            Deluge = {
              icon = "deluge.png";
              href = "http://server.${domain}:8112";
              # widget = {
              #   type = "deluge";
              #   url = "http://server.${domain}:8112";
              #   password = "{{HOMEPAGE_VAR_DELUGE_PASSWORD}}";
              #   enableLeechProgress = true;
              # };
            };
          }
        ];
      }
      {
        AI = [
          {
            OpenWebUI = {
              href = "http://desktop-nixos.${domain}";
              description = "LLM UI";
              icon = "https://docs.openwebui.com/images/logo.png";
            };
          }
          {
            ComfyUI = {
              href = "http://desktop-nixos.${domain}:8188";
              description = "Stable Diffusion UI";
              icon = "https://framerusercontent.com/images/7Nhoxwn9eWYrqKjEewfXutR90U.png?scale-down-to=1024";
            };
          }
          {
            ChatGPT = {
              href = "https://chatgpt.com";
              description = "OpenAI's ChatGPT";
              icon = "openai.svg";
            };
          }
          {
            Claude = {
              href = "https://claude.ai";
              description = "Anthropic's Claude";
              icon = "claude-ai.svg";
            };
          }
        ];
      }
      {
        Utilities = [
          {
            home-assistant = {
              href = "http://server.${domain}:8123";
              description = "Home Assistant";
              icon = "home-assistant.svg";
              # widget = {
              #   type = "homeassistant";
              #   url = "http://server.${domain}:8123";
              #   key = "{{HOMEPAGE_VAR_HOMEASSISTANT_TOKEN}}";
              # };
            };
          }
          {
            immich = {
              href = "http://server.${domain}:2283";
              description = "Photo Library";
              icon = "immich.svg";
              # widget = {
              #   type = "immich";
              #   url = "http://server.${domain}:30041";
              #   key = "{{HOMEPAGE_VAR_IMMICH_API_KEY}}";
              #   version = 2;
              # };
            };
          }
          {
            radicale = {
              href = "http://server.${domain}:5232";
              description = "Calendar";
              icon = "https://radicale.org/assets/logo.svg";
            };
          }
          {
            traefik = {
              href = "http://server.${domain}:8080";
              description = "Traefik Dashboard";
              icon = "traefik.svg";
            };
          }
          {
            minecraft = {
              description = "minecraft";
              icon = "minecraft.svg";
              widget = {
                type = "minecraft";
                url = "tcp://mc.quanchobi.io:25565";
              };
            };
          }
          # adguard coming soon!
        ];
      }
    ];

    widgets = [
      # {
      #   stocks = {
      #     provider = "finnhub";
      #     watchlist = [
      #       "NVDA"
      #       "AMD"
      #       "SPI"
      #     ];
      #   };
      # }
      {
        search = {
          provider = "duckduckgo";
          focus = true;
          showSearchSuggestions = true;
          target = "_blank";
        };
      }
      {
        openmeteo = {
          label = "Danville";
          timezome = "America/Monticello";
          latitude = "{{HOMEPAGE_VAR_LATITUDE}}";
          longitude = "{{HOMEPAGE_VAR_LONGITUDE}}";
          units = "imperial";
        };
      }
    ];
  };
}
