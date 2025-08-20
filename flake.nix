{
  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";

    nvf.url = "github:notashelf/nvf";
    musnix.url = "github:musnix/musnix";
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs-stable,
    home-manager,
    stylix,
    nvf,
    musnix,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs-unstable.lib;
    pkgs = nixpkgs-unstable.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations.AcerHeadless = nixpkgs-unstable.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit pkgs-stable;
      };
      modules = [
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        stylix.nixosModules.stylix
        musnix.nixosModules.musnix

        # Main Config File
        ./machines/acer-headless.nix
        ./modules/default.nix

        # Home Manager
        {
          home-manager.backupFileExtension = "bk";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.maya = ./users/maya-home.nix;

          estreya.desktop.plasma.enable = true;
          estreya.desktop.librewolf.enable = true;
          estreya.gaming.enable = true;
        }
      ];
    };
  };
}
