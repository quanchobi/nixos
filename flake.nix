{
  description = "My NixOS Configuration. Has config for multiple machines. My laptop, desktop, and server are all defined.";

  inputs = {
    ags.url = "github:Aylur/ags";

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nome-manager source. Allows home-manager to be used as a module.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Dependency for the ags widgets i am using
    matugen.url = "github:/InioX/Matugen";

    # Nixpkgs source.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  
    # Unstable nixpkgs source.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Nixvim is a way to declaratively configure neovim in nix
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Stylix is used to configure the entire system effortlessly.
    stylix.url = "github:danth/stylix";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }; # End inputs
  
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, agenix, ... }@inputs: {
    # Define all configurations here.
    nixosConfigurations = {
    # Framework 13 Ryzen 7840U, Radeon 780M, 24gb ddr5 5600mhz.
      framework = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";

	      specialArgs = { inherit inputs; };

        modules = [
	        ./host/framework/configuration.nix

	        inputs.stylix.nixosModules.stylix

          agenix.nixosModules.default

	        # Import home-manager configuration
          home-manager.nixosModules.home-manager {
            home-manager = {
	            useGlobalPkgs = true;
	            useUserPackages = true;

	            sharedModules = [
	              nixvim.homeManagerModules.nixvim 
	            ];

              users.anderson = import ./home/anderson/home.nix;

	            extraSpecialArgs = { inherit inputs; };
	          };
          }
        ];
      };

      # Xeon E5-2683v4, Arc A380, 64gb ecc ddr4 2333mhz, 2 8tb hdds, 4 2tb hdds..
      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      modules = [ ./host/server/configuration.nix ];
      };

      # i9-11900k engineering sample, 2080 super, 64gb ddr4 3200mhz. 
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	      modules = [];
      };
    };
  };
}
