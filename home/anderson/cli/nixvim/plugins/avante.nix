{ config, ... }:
{
  programs.nixvim = {
    plugins.avante = {
      enable = false;
      settings = {
        provider = "ollama";
        claude = {
          api_key_name = "";
        };
      };
    };
  };
}
