{
  options = { };

  imports = [ ];

  config = {
    users = {
      groups.nextcloud = { };
      users.nextcloud = {
        isSystemUser = true;
        group = "nextcloud";
      };
    };

    services = {
      nextcloud = {
        enable = false;
        config = {
          dbtype = "pgsql";
          dbuser = "nextcloud";
          dbname = "nextcloud";
          dbhost = "/run/postgresql";
          # dbpassFile = "";

          adminuser = "admin";
          #adminPassFile = "";
        };
        settings = {
          maintenance_window_start = 2;
          default_phone_region = "en";
          filelocking.enable = true;

          redis = {
          };
        };
      };

      postgresql = {
        enable = false;
        ensureUsers = [
          {
            name = "nextcloud";
            ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
          }
        ];
      };

      redis.servers.nextcloud = {
        enable = false;
        bind = "::1";
        port = 6379;
      };
    };
  };
}
