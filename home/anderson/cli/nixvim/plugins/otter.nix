{
  programs.nixvim = {
    plugins.otter = {
      enable = true;
      autoActivate = true;
      settings = {
        buffers.set_filetype = true;
        lsp.diagnostic_update_events = [
          "BufWritePost"
        ];
      };
    };
  };
}
