{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      quanchobio = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_4;
        serverProperties = {
          difficulty = 3;
          gamemode = 1;
          motd = "KJ'S MINECRAFT SERVER - NOW WITH 100% MORE KJ";
          white-list = true;
        };
        whitelist = {
          kotorifan = "73d0a097-9d5a-44c2-9b2a-322fbb088dc4";
          quanchobi = "6830060b-9598-41e2-9783-ae0b3c4d460f";
          nokillplz = "73835d2b-80ed-45fb-a90e-50783bd63895";
          oppai_and_thighs = "994ede25-d7e9-48e6-b021-0677cdf623ec";
          JEFFMINGUS = "2e3785ec-e5c5-48eb-b450-bf989acb69ad";
          pwn_noobs = "3651f883-8c74-4b92-b732-149d9b8950df";
          bargain_bin = "dc1b64ab-c60c-4f2c-a6be-1437d1791cd0";
        };
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (
            builtins.attrValues {
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/HtiXknlD/lithium-fabric-0.15.0%2Bmc1.21.4.jar";
                hash = "sha256-A0iYTERYfOmDGwIPwc3kMXkbo7m3Ky7MIldwOpr0dZs=";
              };
            }
          );
        };
      };
    };
  };
}
