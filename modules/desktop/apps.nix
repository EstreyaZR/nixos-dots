{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.estreya.desktop.apps;
in {
  options.estreya.desktop.apps = {
    enable = lib.mkEnableOption "enable common desktop utilites";
    default = true;
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.de_DE
      hunspellDicts.en_GB
      obsidian
      jamesdsp
      papers
    ];

    services.pipewire.pulse.enable = true;
  };
}
