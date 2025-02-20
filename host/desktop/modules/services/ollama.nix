{
  services = {
    ollama = {
      enable = true;
      #openFirewall = true;
      #host = "[::]";
      port = 11434;
      loadModels = [
        "deepseek-r1"
        "qwen2.5-coder"
        "codestral"
      ];
    };

    open-webui = {
      enable = true;
      #openFirewall = true;
      #host = "100.120.68.49";
      port = 8081;
    };
  };
}
