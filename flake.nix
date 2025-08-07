{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, stylix, ...}: 
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.Nixos-Acer = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      
      # Main Config File
      ./machines/acer-headless.nix

      # Home Manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.maya = ./users/maya-home.nix;
	  }

      # Stylix 

      ./modules/stylix.nix
      ];
    };
  };
}
