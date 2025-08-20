{
  lib,
  config,
  ...
}: let
  cfg = config.estreya.desktop.gnome;
in {
  options.estreya.desktop.gnome = {
    enable = lib.mkEnableOption "enable gnome";
    default = false;
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      gnome = {
        core-apps.enable = false;
        core-developer-tools.enable = true;
        core-shell.enable = true;
        gnome-keyring.enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      nautilus
    ];
  };
}
