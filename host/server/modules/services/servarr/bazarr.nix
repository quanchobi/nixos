{
  services.bazarr = {
    enable = true;
    group = "multimedia";
    openFirewall = true;
    listenPort = 6767;
  };
}
