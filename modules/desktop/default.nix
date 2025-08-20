{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./plasma.nix
    ./gnome.nix

    ./socialMedia.nix
    ./librewolf.nix
    ./apps.nix
  ];
}
