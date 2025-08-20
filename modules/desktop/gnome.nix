{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.estreya.desktop.gnome;
in {
  options.estreya.desktop.gnome.enable = lib.mkEnableOption "enable gnome";

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      gnome = {
        gnome-keyring.enable = true;
      };
    };
    environment.systemPackages =
      (with pkgs; [
        nautilus
      ])
      ++ (with pkgs.gnomeExtensions; [
        accent-directories
        advanced-weather-companion
        blur-my-shell
        brightness-control-using-ddcutil
        light-style
      ]);
  };
}
