{
  services = {
    ollama = {
      enable = true;
      openFirewall = true;
      loadModels = [ "deepseek-r1:14B" ];
    };

    open-webui = {
      enable = true;
      openFirewall = true;
      host = "100.87.28.41";
    };

    # comfyui.enable = true; # no cpu support
  };
}
