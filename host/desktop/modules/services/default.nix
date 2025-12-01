{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    # ./comfyui.nix # doesn't work
    ./hardware-support.nix
    ./networking.nix
    ./ollama.nix
    ./printing.nix
    ./syncthing.nix
    ./traefik.nix
    ./xkb.nix
  ];
}
