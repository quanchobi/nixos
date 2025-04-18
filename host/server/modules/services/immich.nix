{ config, ... }:
{
  # age.secrets.photoprism-admin-passwd.file = ../../../../secrets/photoprism-admin-passwd.age;
  #
  # services.photoprism = {
  #   enable = true;
  #   port = 2342;
  #   address = "0.0.0.0";
  #   passwordFile = config.age.secrets.photoprism-admin-passwd.path;
  #   originalsPath = "/mnt/mirror-8tb/photos/";
  #
  # settings = {
  #   PHOTOPRISM_ADMIN_USER = "admin";
  #   PHOTOPRISM_DATABASE_DRIVER = "mysql";
  #   PHOTOPRISM_DATABASE_NAME = "photoprism";
  #   PHOTOPRISM_DATABASE_SERVER = "/run/mysqld/mysqld.sock";
  #   PHOTOPRISM_DATABASE_USER = "photoprism";
  #   PHOTOPRISM_SITE_URL = "http://sub.domain.tld:2342";
  #   PHOTOPRISM_SITE_TITLE = "My PhotoPrism";
  # };
  # };

  services.immich = {
    enable = true;
    openFirewall = true;
    settings = null; # might be configured here later.
    host = "100.87.28.41";
    mediaLocation = "/mnt/mirror-8tb/photos/";
  };
}
