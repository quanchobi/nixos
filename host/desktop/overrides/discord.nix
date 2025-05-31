# Adds vencord + openASAR for functionality and fixes issue with discord not launching in wayland on nvidia.
{
  nixpkgs.overlays = [
    (final: prev: {
      discord = prev.discord.overrideAttrs (oldAttrs: {
        withOpenASAR = true;
        withVencord = true;

        # For some reason this can't write to the desktop file. I handle this manually instead.
        # postInstall =
        #   (oldAttrs.postInstall or "")
        #   + ''
        #     substituteInPlace $out/share/applications/discord.desktop \
        #     --replace "Exec=Discord" \
        #     "Exec=env Discord --enable-features=UseOzonePlatform --ozone-platform=x11"
        #   '';
      });
    })
  ];
}
