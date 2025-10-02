{
  # Override orca-slicer to run on mesa instead of nvidia
  nixpkgs.overlays = [
    (_final: prev: {
      orca-slicer = prev.orca-slicer.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          substituteInPlace $out/share/applications/OrcaSlicer.desktop \
            --replace "Exec=orca-slicer" \
                      "Exec=env __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json orca-slicer"
        '';
      });
    })
  ];
}
