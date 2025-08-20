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
        core-apps.enable = lib.mkDefault false;
        core-developer-tools.enable = lib.mkDefault true;
        gnome-keyring.enable = lib.mkDefault true;
        gnome-online-accounts.enable = lib.mkDefault true;
        sushi = lib.mkDefault true;
      };
    };
    environment.systemPackages = with pkgs; [
      nautilus
    ];
  };
}
