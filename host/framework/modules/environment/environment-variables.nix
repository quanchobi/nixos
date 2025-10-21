{ pkgs, ... }:
{
  imports = [ ];

  options = { };

  config = {
    environment.variables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
      HSA_OVERRIDE_GFX_VERSION = "11.0.3";
      ROCM_PATH = "${pkgs.rocmPackages.rocm-runtime}";
    };
  };
}
