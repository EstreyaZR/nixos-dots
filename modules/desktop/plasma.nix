{pkgs, cfg, lib, ...}: 
let 
  cfg = config.estreya.desktop.plasma;
in: {
  options.estreya.desktop.plasma = {
    enable = lib.mkEnableOption "enables native social media apps";
    default = lib.mkDefault true;
  };
  config = lib.mkIf cfg.enable {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = { 
      enable = true;
      package = lib.mkDefault pkgs.kdePackages.sddm;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    environment.systemPackages = with pkgs; [
      kdePackages.okular
      kdePackages.k3b
    ];
}
