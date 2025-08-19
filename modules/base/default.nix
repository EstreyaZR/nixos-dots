
{
  lib,
  pkgs,
  ...
}: {
imports = [
  ./base.nix
  ./stylix.nix
  ./musnix.nix
];
}
