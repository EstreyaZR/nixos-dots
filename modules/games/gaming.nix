{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.gaming;
in {
  options.estreya.gaming = {
    enable = lib.mkEnableOption "Enables native Steam and Lutris";
    default = false;
  };
  config = lib.mkIf cfg.enable {
    programs.steam.enable = true;
    environment.systemPackages = with pkgs; [lutris];
  };
}
