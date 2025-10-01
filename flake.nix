{
  description = "Quanchobi's NixOS Config.";

  # Seemed to make more of my packages be built instead of pulled from cache, so it is disabled.
  nixConfig = {
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim.url = "github:quanchobi/nixvim";

    stylix.url = "github:danth/stylix/release-25.05";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-wsl,
      nixvim,
      agenix,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        framework = nixpkgs.lib.nixosSystem {
          /**
            My laptop.
            Framework 13 Ryzen 7400.
          */
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/framework
            ./host/common

            inputs.nixvim.nixosModules.default
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
          ];
        };

        server = nixpkgs.lib.nixosSystem {
          /**
            My homelab.
            Xeon E5-2683v4, Arc A380, 64gb ecc ddr4 2333mhz, 2 8tb hdds, 4 2tb hdds.
            Used for media, games, and nextcloud.
          */
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/server
            ./host/common

            inputs.nixvim.nixosModules.default
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          /**
            My desktop.
            i9-11900k engineering sample, 2080 super, 64gb ddr4 3200mhz.
            Currently, I mainly use Windows on it.
          */
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/common
            ./host/desktop

            inputs.nixvim.nixosModules.default
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
          ];
        };

        wsl = nixpkgs.lib.nixosSystem {
          /**
            My NixOS VM in WSL.
            Runs on the desktop listed above.
            I run some AI things on it, as well as use it for development.
          */
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/common
            ./host/wsl

            nixos-wsl.nixosModules.default
            inputs.nixvim.nixosModules.default
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
          ];
        };
        rpi = nixpkgs.lib.nixosSystem {
          /**
            Generic RasperryPI conf
          */
          system = "aarch64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/common
            ./host/rpi

            inputs.nixvim.nixosModules.default
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
          ];
        };
      };
    };
}
