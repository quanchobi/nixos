{
  services = {
    ollama = {
      acceleration = "cuda";
      enable = true;
      #openFirewall = true;
      #host = "[::]";
      port = 11434;
      loadModels = [
        "qwen3:4b-thinking"
        "deepseek-r1"
        "qwen2.5-coder"
        "codestral"
        "gemma3:4b"
        "gemma3:12b"
        "gemma3:27b"
      ];
    };

    llama-cpp = {
      enable = true;
      model = "/mnt/steam_games/Models/Qwen3-4B-Thinking-2507-UD-Q8_K_XL.gguf";
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
        #WEBUI_AUTH = "False";
      };
    };
  };
}
