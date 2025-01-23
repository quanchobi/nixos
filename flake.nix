{
  description = "My NixOS Configuration. Has config for multiple machines. My laptop, desktop, and server are all defined.";

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # A declarative way to add firefox addons. Used on desktop and laptop.
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nome-manager source. Allows home-manager to be used as a module.
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixpkgs source.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Unstable nixpkgs source.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Nixvim is a way to declaratively configure neovim in nix. Used for all machines.
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix is used to configure the entire system effortlessly. Used on desktop and laptop.
    stylix.url = "github:danth/stylix/release-24.11";

    # A secure way to store secrets in nixos. Used in all machines.
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }; # End inputs

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable, # Used to get specific packages from unstable
      home-manager,
      nixvim,
      agenix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # Framework 13 Ryzen 7840U, Radeon 780M, 24gb ddr5 5600mhz.
        framework = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./host/framework/configuration.nix
            ./host/common
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

        # Xeon E5-2683v4, Arc A380, 64gb ecc ddr4 2333mhz, 2 8tb hdds, 4 2tb hdds.
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./host/server/configuration.nix
            ./host/common
            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = false;
                };
              };
            }
          ];
        };

        # i9-11900k engineering sample, 2080 super, 64gb ddr4 3200mhz.
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
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

                users.anderson = import ./home/anderson/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  enableGui = true;
                };
              };
            }
          ];
        };

        # WSL2. Same hardware as desktop.
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./host/common
            ./host/wsl
            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

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
    }; # End outputs
}
