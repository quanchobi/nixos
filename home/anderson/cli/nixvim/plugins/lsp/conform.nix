{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      shfmt
      stylua
    ];
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;
        formatters_by_ft = {
          bash = [ "shfmt" ];
          sh = [ "shfmt" ];
          css = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          html = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          javascript = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          javascriptreact = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          lua = [ "stylua" ];
          markdown = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          nix = [ "nixfmt-rfc-style" ];
          python = [ "black" ];
          typescript = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          typescriptreact = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          yaml = [ "yamlfmt" ];
          hcl = [ "hclfmt" ];
        };
        formatters = {
          "nixfmt-rfc-style" = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
          black = {
            args = [ "--fast" ];
          };
          prettier = {
            args = [ "--no-semi" ];
          };
        };
      };
    };
    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
    ];
  };
}
