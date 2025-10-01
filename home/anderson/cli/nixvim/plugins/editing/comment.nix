{
  programs.nixvim = {
    plugins.comment = {
      enable = true;
      settings = {
        # ignore = "^const(.*)=(%s?)%((.*)%)(%s?)=>";
        # opleader = {
        #   block = "gb";
        #   line = "gc";
        # };
        # post_hook = ''
        #   function(ctx)
        #   if ctx.range.srow == ctx.range.erow then
        #     -- do something with the current line
        #   else
        #     -- do something with lines range
        #       end
        #       end
        #       '';
        # pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
        # toggler = {
        #   block = "gbc";
        #   line = "gcc";
        # };
      };
    };
  };
}
