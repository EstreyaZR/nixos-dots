{
  lib,
  pkgs,
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
}
