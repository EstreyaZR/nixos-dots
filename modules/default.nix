{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./base.nix
    ./desktop.nix
    ./gaming.nix
    ./musnix.nix
    ./neovim-per-nvf.nix
    ./programming.nix
    ./stylix.nix
    ./librewolf.nix
  ];
}
