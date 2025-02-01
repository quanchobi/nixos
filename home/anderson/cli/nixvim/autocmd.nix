{
  programs.nixvim = {
    autoCmd = [
      {
        desc = "Vertically center document when entering insert mode";
        event = "InsertEnter";
        command = "norm zz";
      }
      {
        desc = "Open help in horizontal split";
        event = "FileType";
        pattern = "help";
        command = "wincmd H";
      }
      {
        desc = "Close telescope prompt in insert mode by clicking escape";
        event = "FileType";
        pattern = "TelescopePrompt";
        command = "inoremap <buffer><silent> <ESC> <ESC>:close!<CR>";
      }

      # File specific commands
      {
        desc = "Set nix filetype indent";
        event = [ "FileType" ];
        pattern = "nix";
        command = "setlocal shiftwidth=2 tabstop=2";
      }

      {
        desc = "Set wrap for markdown files";
        event = [ "FileType" ];
        pattern = "md";
        command = "set wrap";
      }

      {
        desc = "Enable Otter for markdown files";
        event = [ "FileType" ];
        pattern = "md";
        command = "lua require'otter'.activate()";
      }
    ];
  };
}
