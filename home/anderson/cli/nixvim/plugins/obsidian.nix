{
  programs.nixvim = {
    opts.conceallevel = 2; # necessary for obsidian

    plugins = {
      obsidian = {
        enable = true;
        settings = {
          completion = {
            min_chars = 2;
            nvim_cmp = true;
          };
          new_notes_location = "current_dir"; # I hate that this isn't default
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
          mappings = {
            gf = {
              action = "require('obsidian').util.gf_passthrough";
              opts = {
                noremap = false;
                expr = true;
                buffer = true;
              };
            };
          };
        };
      };

      markview = {
        enable = true;
        settings = { };
      };
    };
  };
}
