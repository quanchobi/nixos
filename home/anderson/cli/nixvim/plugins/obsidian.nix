{
  programs.nixvim = {
    opts.conceallevel = 2; # necessary for obsidian

    plugins = {
      obsidian = {
        enable = true;
        settings = {
          workspaces = [
            {
              name = "second-brain";
              path = "~/obsidian/second-brain";
            }
            {
              name = "journal";
              path = "~/obsidian/journal";
            }
            {
              name = "school";
              path = "~/obsidian/school";
            }
            {
              name = "website";
              path = "~/obsidian/website";
            }
          ];
        };
      };

      render-markdown = {
        enable = true;
        settings = { };
      };
    };
  };
}
