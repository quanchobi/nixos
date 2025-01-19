{
  programs.nixvim = {
    autocmd = [
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
    ];
  };
}