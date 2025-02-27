{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      cmp-dap.enable = true;

      dap = {
        enable = true;
        extensions = {
          dap-virtual-text.enable = true;

          dap-ui = {
            enable = true;
            floating.mappings = {
              close = [
                "<ESC>"
                "q"
              ];
            };
          };
        };
        signs = {
          dapBreakpoint = {
            text = "";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "";
            texthl = "DapLogPoint";
          };
        };
      };
    };

    keymaps = [
      # TODO
    ];

    # Allow DAP UI to automatically open and close when possible
    extraConfigLua = ''
      require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
      require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
      require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
    '';

    extraPlugins = [ pkgs.vimPlugins.telescope-dap-nvim ];
  };
}
