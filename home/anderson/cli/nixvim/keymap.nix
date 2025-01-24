{
  # Vanilla keybinds go here. Keybinds for specific plugins are defined in that plugins file.
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "v";
        key = "J";
        action = ''
          :m '>+1<CR>gv=gv
        '';
        options.desc = "Move selected line down";
      }
      {
        mode = "v";
        key = "K";
        action = ''
          :m '<-2<CR>gv=gv
        '';
        options.desc = "Move selected line up";
      }
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options.desc = "Keep cursor in same place when appending line using J";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Center cursor on screen when navigating with C-d";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Center cursor on screen when navigating with C-u";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options.desc = "Center cursor on screen when searching for text";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options.desc = "Center cursor on screen when searching for text";
      }
      {
        mode = "v";
        key = "<leader>y";
        action = ''
          [["+Y]]
        '';
        options.desc = "Copies selection into system clipboard";
      }
      {
        mode = "n";
        key = "<leader>s";
        action = ''
          [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
        '';
        options.desc = "Replace selected word";
      }
    ];
  };
}
