{
  programs.nixvim = {
    opts.conceallevel = 2;
    plugins.obsidian = {
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
  };
}
