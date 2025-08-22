{lib, ...}: {
  imports = [
    ./freshrss.nix
    ./virtualiation.nix
    ./podman.nix
  ];

  estreya.virt.enable = lib.mkDefault false;
  estreya.podman.enable = lib.mkDefault false;
  estreya.freshrss.enable = lib.mkDefault false;
}
