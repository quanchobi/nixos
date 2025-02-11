{
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    extraComponents = [
      "esphome"
      "met"
      "radio_browser"
    ];
    extraPackages =
      python3Packages: with python3Packages; [
        numpy
        aiodhcpwatcher
        aiodiscover
        gtts
      ];
    config = {
      http = {
        server_port = 8123;
        use_x_forwarded_for = true;
        trusted_proxies = [
          "127.0.0.1"
          "::1"
        ];
      };
    };
  };
}
