{
  programs.nixvim = {
    plugins.conform-nvim = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        python = [ "isort" "black" ];
        cpp = [ "clang_format" ];
      };
    };
  };
}
