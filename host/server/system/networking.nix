{
  services.traefik = {
    enable = true;
    dynamicConfigOptions = {
      http = {
        
      };
    };

    staticConfigOptions = {
      certificatesResolvers = {
        tailscale.tailscale = {};
      };
    };
  };

  services.tailscale = {
    enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.hostName = "server";
  
  networking.firewall.checkReversePath = "loose"; # Necessary for tailscale + mullvad (see https://github.com/tailscale/tailscale/issues/10319)

  users.users.anderson.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMltYp0nSf+aRcpKo9hysa2kHTGOiguAMEVzpL6gMgHC anderson@framework" ];
}
