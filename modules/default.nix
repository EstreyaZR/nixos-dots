{...}: {
  imports = [
    ./base/default.nix
    ./desktop/default.nix
    ./games/default.nix
    #./server/default.nix

    ./programming.nix
    ./neovim-per-nvf.nix
  ];
}
