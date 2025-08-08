{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = {self, nixpkgs, home-manager, stylix, nvf, ...}: 
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.Nixos-Acer = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
        home-manager.nixosModules.home-manager
	nvf.nixosModules.default
        stylix.nixosModules.stylix
      
        # Main Config File
        ./machines/acer-headless.nix
        ./modules/programming.nix
	./modules/neovim-per-nvf.nix
        
	# Home Manager
          {
	    home-manager.backupFileExtension = "bk";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.maya = ./users/maya-home.nix;
	  }

        # Stylix 

        ./modules/stylix.nix

        # MANDATORY BASE
        ./modules/base-desktop.nix
      ];
    };
  };
}
