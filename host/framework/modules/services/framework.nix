{
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "server" = {
          id = "";
        };
      };
      folders = {
        "school" = {
          path = "";
          devices = "server";
        };
      };
    };
  };
}
