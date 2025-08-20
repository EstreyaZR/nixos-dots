{
  pkgs,
  lib,
  config,
}: let
  cfg = config.estreya.desktop.cosmic;
in {
  options.estreya.desktop.cosmic = {
    enable = lib.mkEnableOption "enable cosmic";
    default = false;
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
    };
    environment.systemPackages = with pkgs; [
      cosmic-term
      cosmic-bg
      cosmic-osd
      cosmic-edit
      cosmic-comp
      cosmic-store
      cosmic-randr
      cosmic-panel
      cosmic-icons
      cosmic-files
      cosmic-player
      cosmic-applet
      cosmic-settings
      cosmic-launcher
      cosmic-protocols
      cosmic-wallpapers
      cosmic-screenshots
      cosmic-notifications
      cosmic-applibrary
    ];
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-cosmic];
    };
  };
}
