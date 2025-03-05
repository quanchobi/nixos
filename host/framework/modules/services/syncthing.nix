{
  services.syncthing = {
    enable = true;
    user = "anderson";
    settings = {
      devices = {
        desktop = {
          addresses = [
            "tcp://100.120.68.49"
          ];
          id = "K4PSW5J-PYDTULM-37TVMSB-OHRLV37-SB2ITIP-OAQQYNF-ETXF63J-FIRUZQK";
        };
      };
      folders = {
        "/home/anderson/.config/OrcaSlicer/" = {
          devices = [ "desktop" ];
        };
      };
    };
  };
}
