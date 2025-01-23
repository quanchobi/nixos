{
  programs.nixvim = {
    plugins.ollama = {
      enable = true;
      url = "http://server:11434";
      model = "llama3.2:3B"; # Using a small model for speed
    };
    keymaps = [
      {
        key = "<leader>oo";
        action = ":<c-u>lua require('ollama').prompt()<cr>";
        options.desc = "ollama prompt";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "<leader>oG";
        action = ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>";
        options.desc = "ollama Generate Code";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
