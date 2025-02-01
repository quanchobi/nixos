{ pkgs, ... }:
let
  get_bufnrs.__raw = ''
    -- lua
       function()
         local buf_size_limit = 1024 * 1024 -- 1MB size limit
         local bufs = vim.api.nvim_list_bufs()
         local valid_bufs = {}
         for _, buf in ipairs(bufs) do
           if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
             table.insert(valid_bufs, buf)
           end
         end
         return valid_bufs
       end
  '';
in
{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          preselect = ''
            cmp.PreselectMode.None
          '';

          snippets.expand = ''
            function(args) require('luasnip').lsp_expand(args.body) end
          '';

          sources = [
            {
              name = "nvim_lsp";
              priority = 1000;
              option = { inherit get_bufnrs; };
            }
            {
              name = "nvim_lsp_document_symbol";
              priority = 1000;
              option = { inherit get_bufnrs; };
            }
            {
              name = "nvim_lsp_signature_help";
              priority = 1000;
              option = { inherit get_bufnrs; };
            }
            {
              name = "treesitter";
              priority = 850;
              option = { inherit get_bufnrs; };
            }
            # {
            #   name = "cmp_ai";
            #   priority = 775;
            # }
            {
              name = "luasnip";
              priority = 750;
            }
            {
              name = "buffer";
              priority = 500;
              option = { inherit get_bufnrs; };
            }
            {
              name = "dictionary";
              priority = 300;
            }
            {
              name = "latex_symbols";
              priority = 300;
              option = {
                strategy = 2; # Insert latex command
              };
            }
            {
              name = "path";
              priority = 300;
            }
            {
              name = "rg";
              priority = 300;
            }
            {
              name = "emoji";
              priority = 100;
            }
          ];

          mapping = {
            "<C-d>" = # Lua
              "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = # Lua
              "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = # Lua
              "cmp.mapping.complete()";
            "<C-e>" = # Lua
              "cmp.mapping.close()";
            "<Tab>" = # Lua
              "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<S-Tab>" = # Lua
              "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<CR>" = # Lua
              "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
          };
          window = {
            completion.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            documentation.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
          };
        };
      };

      lspkind = {
        enable = true;
        cmp.enable = true;
      };

      luasnip = {
        enable = true;
        settings.enable_autosnippets = true;
        fromVscode = [
          {
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };

      cmp-nvim-lsp-signature-help = {
        enable = true;
      };

      friendly-snippets.enable = true;

      # cmp-ai = {
      #   enable = true;
      #   settings = {
      #     provider = "Ollama";
      #     provider_options = {
      #       model = "qwen2.5-coder:32b";
      #       base_url = "http://100.87.28.41/api/generate"; # use my server for ollama
      #     };
      #   };
      # };
    };
  };
}
