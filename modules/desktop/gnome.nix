{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.estreya.desktop.gnome;
in {
  options.estreya.desktop.gnome = {
    enable = lib.mkEnableOption "small gnome env";
    default = false;
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      gnome = {
        core-apps.enable = false;
        core-developer-tools.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        sushi = true;
      };
    };
    environment.systemPackages = with pkgs; [
      nautilus
    ];
  };
}
