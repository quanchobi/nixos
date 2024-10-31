{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    shares = {
      mediashare = {
        path = "/mnt/crypt/samba_share";
        "read only" = true;
        "write list" = "anderson";
        browsable = "yes";
        "guest ok" = "yes";
        comment = "my media samba share";
      };
    };

    extraConfig = ''
      guest account = nobody
      map to guest = bad user
    '';
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  networking.firewall.allowPing = true;
}
