{
  programs.nixvim = {
    plugins.avante = {
      enable = true;
      settings = {
        provider = "ollama";
        vendors = {
          ollama = {
            __inherited_from = "openai";
            api_key_name = "ollama";
            endpoint = "http://server:11434/v1";
            model = "llama3.2";
          };
        };
      };
    };
  };
}
