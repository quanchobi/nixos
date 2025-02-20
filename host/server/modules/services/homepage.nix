{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    services = [
      {
        "*arr" = [
          {
            "Radarr" = {
              description = "A movie torrent client";
              href = "localhost:7878";
            };
            "Sonarr" = {
              description = "A TV/Anime torrent client";
              href = "localhost:8989";
            };
            "Lidarr" = {
              description = "A music torrent client";
              href = "localhost:8686";
            };
            "Readarr" = {
              description = "A book torrent client";
              href = "localhost:7878";
            };
            "Prowlar" = {
              description = "A torrent torrent client";
              href = "localhost:9696";
            };
          }
        ];
      }
    ];
  };
}
