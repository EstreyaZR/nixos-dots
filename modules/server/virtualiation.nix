{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.virt;
in {
  options.estreya.virt = {
    enable = lib.mkEnableOption "enable virt, podman and stuff";
    default = true;
  };
  config = lib.mkIf cfg.enable {
    services.podman.enable = true;

    virtualisation = {
      podman.enable = true;
      environment.systemPackages = with pkgs; [
        gnome-boxes
      ];
    };
  };
}
