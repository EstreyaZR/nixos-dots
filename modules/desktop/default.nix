{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./plasma.nix
    ./gnome.nix
    ./cosmic.nix

    ./socialMedia.nix
    ./librewolf.nix
    ./apps.nix
  ];
  estreya.desktop = {
    apps.enable = lib.mkDefault true;
    gnome.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;

    plasma.enable = lib.mkDefault false;
    cosmic.enable = lib.mkDefault false;
  };
}
