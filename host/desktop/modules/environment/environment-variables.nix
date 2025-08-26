{ ... }:
{
  imports = [ ];

  options = { };

  config = {
    environment.variables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
