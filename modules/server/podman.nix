{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.estreya.podman;
in {
  options.estreya.podman.enable = lib.mkEnableOption "Podman Setup";
  config = lib.mkIf cfg.enable {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
      };
    };
    environment.systemPackages = with pkgs; [
      distrobox
    ];
    hardware.nvidia-container-toolkit.enable = true;
  };
}
