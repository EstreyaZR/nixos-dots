{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.virt;
in {
  options.estreya.virt.enable = lib.mkEnableOption "enable virt, podman and stuff";
  config = lib.mkIf cfg.enable {
    boot.binfmt.emulatedSystems = [
      "aarch64-linux"
      "riscv64-linux"
    ];

    virtualisation = {
      libvirtd.enable = true;
    };
    environment.systemPackages = with pkgs; [
      gnome-boxes
      qemu
    ];
    users.users.maya = {extraGroups = ["libvirtd"];};
  };
}
