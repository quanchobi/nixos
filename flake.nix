{
  description = "Quanchobi's NixOS Config.";

  # Seemed to make more of my packages be built instead of pulled from cache, so it is disabled.
  # nixConfig = {
  #   substituters = [
  #     "https://nix-community.cachix.org"
  #   ];
  #   trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #   ];
  # };

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    # Currently unused, but might add for my desktop.
    # nixified-ai.url = "github:nixified-ai/flake";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-24.11";

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      #nixified-ai, # Currently unused
      nixos-wsl,
      nixvim,
      agenix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        framework = nixpkgs.lib.nixosSystem {
          /**
            My laptop.
            Framework 13 Ryzen 7400.
            Most used device.
          */
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/framework
            ./host/common

            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];
                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = true;
                };
              };
            }
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

            # inputs.nixified-ai.nixosModules.comfyui
            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];
                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = false;
                };
              };
            }
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

            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default

            # Import home-manager configuration
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];

                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = true;
                };
              };
            }
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
            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];

                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = false;
                };
              };
            }
          ];
        };
        rpi = nixpkgs.lib.nixosSystem {
          /**
            My NixOS VM in WSL.
            Runs on the desktop listed above.
            I run some AI things on it, as well as use it for development.
          */
          system = "aarch64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host/common
            ./host/rpi

            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];

                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = false;
                };
              };
            }
          ];
        };
      };
    };
}
