{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.estreya.freshrss;
in {
  options.estreya.freshrss.enable = lib.mkEnableOption "Podman Setup";
  config = lib.mkIf cfg.enable {
    services.freshrss = {
      enable = true;
      language = "de";
    };
  };
}
