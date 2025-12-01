{
  description = "Quanchobi's NixOS Config.";

  # Seemed to make more of my packages be built instead of pulled from cache, so it is disabled.
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://cuda-maintainers.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:quanchobi/home-manager";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixvim.url = "github:quanchobi/nixvim";

    stylix.url = "github:danth/stylix/release-25.05";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-wsl,
      nixvim,
      agenix,
      stylix,
      treefmt-nix,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      treefmtEval = forAllSystems (
        system:
        treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true; # Format Nix files
            prettier.enable = true; # Format JSON, YAML, Markdown
            shellcheck.enable = true; # Lint shell scripts
            shfmt.enable = true; # Format shell scripts
          };
          settings.formatter = {
            prettier.excludes = [ "*.lock" ];
          };
        }
      );
    in
    {
      # Formatter for `nix fmt`
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      # Checks for `nix flake check`
      checks = forAllSystems (system: {
        formatting = treefmtEval.${system}.config.build.check self;
      });

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

            nixvim.nixosModules.default
            stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.inputs.home-manager.nixosModules.home-manager
            home-manager.nixosModules.default
            { system.gui.enable = true; }
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

            nixvim.nixosModules.default
            stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.inputs.home-manager.nixosModules.home-manager
            home-manager.nixosModules.default
            { system.gui.enable = false; }
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

            nixvim.nixosModules.default
            stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.inputs.home-manager.nixosModules.home-manager
            home-manager.nixosModules.default
            { system.gui.enable = true; }
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
            nixvim.nixosModules.default
            stylix.nixosModules.stylix
            agenix.nixosModules.default

            home-manager.inputs.home-manager.nixosModules.home-manager
            home-manager.nixosModules.default
            { system.gui.enable = false; }
          ];
        };
      };
    };
}
