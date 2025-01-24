{
  programs.nixvim = {
    plugins.godot = {
      enable = true;
      settings = { };
    };
    keymaps = [
      {
        key = "<F4>";
        action = ":GodotRunLast<CR>";
        options.desc = "Godot Run Last";
      }
    ];
  };
}
