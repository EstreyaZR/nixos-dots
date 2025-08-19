
{
  lib,
  pkgs,
  ...
}: {
imports = [
  ./plasma.nix
  ./socialMedia.nix
  ./librewolf.nix
  ./apps.nix
];
}
