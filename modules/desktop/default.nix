
{
  lib,
  pkgs,
  ...
}: {
import = [
  ./plasma.nix
  ./socialMedia.nix
  ./apps.nix
];
}
