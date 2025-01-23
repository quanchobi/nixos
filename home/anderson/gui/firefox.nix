{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ ];

  options = { };

  config = {
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;

          settings = {
            "browser.startup.homepage" = "https://google.com";
            "browser.search.defaultenginename" = "Google";
            "browser.search.order.1" = "Google";
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          };

          search = {
            force = true;
            default = "Google";
            order = [
              "Searx"
              "Google"
            ];

            engines = {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "NixOS Wiki" = {
                urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@nw" ];
              };
              "Searx" = {
                urls = [ { template = "https://baresearch.org/?q={searchTerms}"; } ];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@searx" ];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
          };

          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            ublock-origin
            darkreader
            privacy-badger
            decentraleyes
          ];
        };
      };

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DontCheckDefaultBrowser = true;
        DisablePocket = true;
        SearchBar = "unified";
      };
    };
  };
}
