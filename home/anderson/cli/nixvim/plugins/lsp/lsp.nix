{ pkgs, ... }: {
  programs.nixvim = {
    plugins.cmp-nvim-lsp.enable = true;
    plugins.fidget.enable = true;
    plugins.lsp-format.enable = true;

    #extraPlugins = with pkgs.vimPlugins; [

    #];
    plugins.lsp = {
      inlayHints = true;
      enable = true;
      servers = {
        nixd.enable = true;
        clangd.enable = true;
        html.enable = true;
        pyright.enable = true;
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
}
