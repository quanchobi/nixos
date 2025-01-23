{
  services = {
    ollama = {
      enable = true;
      openFirewall = true;
      host = "[::]";
      port = 11434;
      loadModels = [
        "deepseek-r1:8B"
        "deepseek-r1:14B"
        "llama3.1:8b"
        "llama3.2:3b"
      ];
    };

    open-webui = {
      enable = true;
      openFirewall = true;
      host = "100.87.28.41";
      port = 8080;
    };

    # comfyui.enable = true; # no cpu support :(
  };
}
