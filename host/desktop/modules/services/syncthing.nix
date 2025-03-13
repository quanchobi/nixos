{
  services.syncthing = {
    enable = true;
    user = "anderson";
    settings = {
      devices = {
        framework = {
          addresses = [
            "tcp://100.119.124.119"
          ];
          id = "Y5MHMRC-3H6CLR6-B73GDCZ-GPRUDE5-N32LTPD-5WA2EEB-7E53PPF-4XJ7WAF";
        };
      };
      folders = {
        "/home/anderson/.config/OrcaSlicer/" = {
          devices = [ "framework" ];
        };
      };
    };
  };
}
