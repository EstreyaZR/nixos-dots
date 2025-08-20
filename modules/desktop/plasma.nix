{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.estreya.desktop.plasma;
in {
  options.estreya.desktop.plasma = {
    enable = lib.mkEnableOption "enables plasma6";
    default = true;
  };
  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        package = lib.mkDefault pkgs.kdePackages.sddm;
        #wayland = {
        #  enable = true;
        #  compositor = "kwin";
        #};
      };
    };
    environment.systemPackages = with pkgs.kdePackages; [
      k3b
      okular
    ];
  };
}
