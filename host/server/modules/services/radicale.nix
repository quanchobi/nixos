{
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      auth = {
        # TODO: agenix encrypted authentication
        #htpasswd_filename = "/run/agenix/...";
        #htpasswd_encryption = "plain";
        type = "none";
      };
    };
  };
}
