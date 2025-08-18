{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.desktop.socialMedia;
in {
  options.estreya.desktop.socialMedia = {
    enable = lib.mkEnableOption "enables native social media apps";
    default = lib.mkDefault false;
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      telegram-destkop
      discord
    ];
  };
}
