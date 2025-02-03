{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "guest account" = "nobody";
        "map to guest" = "bad user";
        security = "user";
      };
      # Contains torrented media
      "mediashare" = {
        path = "/mnt/crypt/samba_share";
        "read only" = true;
        "write list" = "anderson";
        browsable = "yes";
        "guest ok" = "yes";
        comment = "my media samba share";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  networking.firewall.allowPing = true;
}
