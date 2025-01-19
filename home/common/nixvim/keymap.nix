{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move selected line down";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '>-2<CR>gv=gv";
        options.desc = "Move selected line up";
      }
      { # Cursor remains in place when appending using S-j
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
      { # Keeps cursor centered vertically when navigating with C-d
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      { # Keeps cursor centered vertically when navigation with C-u
        mode = "n";
        key = "<C-u>";
        action = "<C-d>zz";
      }
      { # Keeps cursor centered vertically when searching for text
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "v";
        key = "<leader>y";
        action = "[[\"+y]]";
        options.desc = "Copies selection into system clipboard";
      }
      {
        mode = "n";
        key = "<leader>s";
        action = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
        options.desc = "Replace selected word";
      }
    ];
  };
}
