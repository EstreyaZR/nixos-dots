{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.desktop.gaming;
in {
  options.estreya.desktop.gaming = {
    enable = lib.mkEnableOption "Enables native Steam and Lutris";
    default = false;
  };
  config = lib.mkIf cfg.enable {
    programs.steam.enable = true;
    environment.systemPackages = with pkgs; [lutris];
  };
}
