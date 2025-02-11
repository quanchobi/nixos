{
  services = {
    ollama = {
      enable = true;
      openFirewall = true;
      host = "[::]";
      port = 11434;
      loadModels = [
        "deepseek-r1:14B"
        #"llama3.1:8b"
        "qwen2.5-coder:7b"
        "codestral"
      ];
    };

    open-webui = {
      enable = true;
      openFirewall = true;
      host = "100.87.28.41";
      port = 8081;
    };

    # comfyui.enable = true; # no cpu support :(
  };
}
