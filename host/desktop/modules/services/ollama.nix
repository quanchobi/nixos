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
        "gemma3:4b"
        "gemma3:12b"
        "gemma3:27b"
      ];
    };

    open-webui = {
      enable = true;
      #openFirewall = true;
      #host = "100.120.68.49";
      stateDir = "/var/lib/open-webui";
      port = 8081;
      environment = {
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
        WEBUI_AUTH = "False";
      };
    };
  };
}
