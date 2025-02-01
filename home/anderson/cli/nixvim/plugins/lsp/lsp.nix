{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp.enable = true;
      fidget.enable = true;
      lsp-format.enable = true;
      lsp = {
        inlayHints = true;
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
          html.enable = true;
          pyright.enable = true;
          markdown_oxide.enable = true;
          ltex.enable = true;
          #textlsp.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = false;
          };
          ts_ls.enable = true;
          lua_ls.enable = true;
        };
      };
    };
  };
}
