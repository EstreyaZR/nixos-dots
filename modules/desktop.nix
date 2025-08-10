{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.desktop;
in {
  options.estreya.desktop = {
    enable = lib.mkEnableOption "enable common desktop utilites and kde6";
    default = lib.mkDefault true;
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt6
      obsidian
      anki
      kdePackages.okular
      jamesdsp
    ];

    services.pipewire.pulse.enable = true;
  };
}
