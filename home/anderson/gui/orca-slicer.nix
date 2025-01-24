{ pkgs, ... }:
{
  packagesOverrides = pkgs: {
    orca-slicer = pkgs.orca-slicer.override {
      # Update webgtk version so it doesn't crash when adding network printer
    };
  };
}
