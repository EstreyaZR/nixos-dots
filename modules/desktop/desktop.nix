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
    default = true;
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.de_DE
      hunspellDicts.en_GB
      obsidian
      anki-bin
      kdePackages.okular
      jamesdsp
      tauon
    ];

    services.pipewire.pulse.enable = true;
  };
}
