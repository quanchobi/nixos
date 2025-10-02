# Shamelessly stolen from https://github.com/elythh/nixvim/tree/old/flake
{
  projectRootFile = "flake.nix";

  programs = {
    deadnix = {
      enable = true;
    };
    isort.enable = true;
    nixfmt.enable = true;
    statix.enable = true;
    stylua.enable = true;
    prettier.enable = true;
    shfmt.enable = true;
    shellcheck.enable = true;
  };

  settings = {
    global.excludes = [
      "*.editorconfig"
      "*.envrc"
      "*.gitconfig"
      "*.git-blame-ignore-revs"
      "*.gitignore"
      "*.gitattributes"
      "*.luacheckrc"
      "*CODEOWNERS"
      "*LICENSE"
      "*flake.lock"
      "assets/*"
      "*.age"
      ".direnv/*"
      "result"
      "result-*"
    ];
  };

  settings.formatter = {
    deadnix = {
      priority = 1; # Run before other formatters
      excludes = [
      ];
    };

    prettier = {
      includes = [
        "*.md"
        "*.json"
        "*.yaml"
        "*.yml"
      ];
    };
  };
}
